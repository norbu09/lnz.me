-module(just_me).
-export([start/0, handle/3]).

-define(DB, "just_me").
-define(TEASER_LEN, 100).

start() ->
    axiom:start(?MODULE).


%%%%% router handler %%%%
handle(<<"GET">>, [], _Request) ->
    {_Date={Year,_Month,_Day},_Time={_Hour,_Minutes,_Seconds}} = erlang:localtime(),
    axiom:dtl(index, [{year, Year}]);

handle(<<"GET">>, [<<"about">>], _Request) ->
    axiom:dtl(about, []);

handle(<<"GET">>, [<<"feed">>], _Request) ->
    Posts = get_view("by_time", [include_docs]),
    %io:format("Got Posts: ~p~n", [Posts]),
    axiom:dtl(feed, [{posts, Posts}]);

handle(<<"GET">>, [<<"feed">>, Title], _Request) ->
    [P|_Posts] = get_view("links", [{key, Title}, include_docs]),
    %io:format("Got Posts: ~p~n", [P]),
    axiom:dtl(post, [{post, P}]).

%%%% internal stuff %%%%

get_view(View, Options) ->
    {ok, Db} = connect_couchdb(),
    Posts = case couchbeam_view:fetch(Db, {"posts", View}, Options) of
        {ok, Json} -> [ lists:keymap(fun(Atom) -> binary_to_list(Atom) end, 1, A) || A <- proplists:unfold([ Y || {Y}  <- [proplists:get_value(<<"doc">>, X) || {X} <- Json]])];
        _ -> []
    end,
    [ filter_post(Post)  || Post  <- Posts ].


connect_couchdb() ->
    Url = "http://localhost:5984",
    Options = [],
    S = couchbeam:server_connection(Url, Options),
    couchbeam:open_db(S, ?DB, Options).

% we can muck around with the post here
filter_post(Post) ->
    Post1 = lists:map(fun(Tuple) -> filter_tuple(Tuple) end, Post),
    lists:flatten(Post1).

% we can muck around with individual lines here
filter_tuple(Tuple) ->
    case Tuple of
        {"body", Body} ->
            Body1 = binary_to_list(Body),
            case string:words(Body1) of
                N when N > ?TEASER_LEN -> 
                    Teaser = string:join(lists:sublist(string:tokens(Body1, " "), ?TEASER_LEN), " "),
                    [{"teaser", markdown:conv(Teaser)}, {"body", markdown:conv(Body1)}];
                N when N =< ?TEASER_LEN -> 
                    {"body", markdown:conv(Body1)}
            end;
        {"title", Title} ->
            Link = string:join(string:tokens(string:to_lower(binary_to_list(Title)), " "), "_"),
            [{"title", Title}, {"link", Link}];
        _ ->
            Tuple
    end.
