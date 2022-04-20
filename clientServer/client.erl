-module(client).
-export([alloc/0,free/1]).

alloc() ->
    call(alloc).

free(Resource) ->
    call({free, Resource}).

call(Request) ->
    server ! {request, self(), Request},  
    receive
    {reply, Reply} ->
        Reply

end.