-module(twitter).

-compile(export_all).

start(Consumer) ->
  oauth_client:start(Consumer).

get_request_token(Client) ->
  URL = "https://twitter.com/oauth/request_token",
  oauth_client:get_request_token(Client, URL).

authorize_url(Token) ->
  oauth:uri("https://twitter.com/oauth/authorize", [{"oauth_token", Token}]).

get_access_token(Client, Verifier) ->
  URL = "https://twitter.com/oauth/access_token",
  oauth_client:get_access_token(Client, URL, [{"oauth_verifier", Verifier}]).

get_favorites(Client) ->
  URL = "https://api.twitter.com/1.1/favorites/list.json",
  oauth_client:get(Client, URL, []).

verify_credentials(Client) ->
  URL = "https://api.twitter.com/1.1/account/verify_credentials.json",
  oauth_client:get(Client, URL, []).
