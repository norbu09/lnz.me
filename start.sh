#!/bin/sh

./rebar compile

erl -pa ebin deps/*/ebin +A 4\
    -eval "io:format(\"Point your browser at http://localhost:7654~n\")."\
    -eval "couchbeam:start()."\
    -eval "application:start(just_me)."
