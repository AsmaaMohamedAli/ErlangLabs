-module(server).
-export([start/0]).
-export([init/0]).

start() ->
    spawn(server, init, []).
init() ->
    register(server, self()),
    Resources = hw:get_resources(),
    loop(Resources).


loop(ResDB) ->
receive
    {request, From, alloc} ->
        {Resource, NewResDB} = hw:alloc(ResDB),
        From ! {reply, Resource},
        loop(NewResDB);
    {requet, From, {free, Resource}}->
        From ! {reply, ok},
        loop(hw:free(Resource, ResDB));
    _Other ->
        loop(ResDB)

end.