%%% OTP application behavior for just_me
-module(just_me_app).
-behaviour(application).
-export([start/2, stop/1]).

%% Start the just_me application
start(_StartType, _StartArgs) ->
  application:start(crypto),
  application:start(ranch),
  application:start(cowboy),
  axiom:start(just_me),
  just_me_sup:start_link().

%% Stop the just_me application
stop(_State) ->
  ok.
