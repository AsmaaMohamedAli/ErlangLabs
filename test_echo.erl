-module(test_echo).
-export([start/1, init/1]).
start(N)->
    spawn(test_echo, init, [N]).
init(N)->
    Epid = echo:start(),
    loop(N, Epid).
loop(0, Epid) ->
    Epid ! stop,
    io:format("Echo passed this test ~n", []);
loop(N, Epid) ->
    Epid ! {self(), N},
    io:format("Sending message, N= ~p~n", [N]),
    receive
        stop ->
            true;
        {Epid, N} ->
            loop(N-1, Epid)
end.