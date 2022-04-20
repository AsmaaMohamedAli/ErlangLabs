-module (echo).
-export ([start/0, init/0]).

start() ->
    spawn(echo, init, []).

init() ->
    loop().

loop() ->
    receive
        stop ->
            true;
    {Pid, Msg} ->
        Pid ! {self(), Msg},
        loop()

end.