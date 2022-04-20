-module(hw).
-export([get_resources/0,alloc/1,free/2]).

get_resources()->
    [1,2,3,4].

alloc([])->
    {noRes, []};
alloc([H|T])->
    {H,T}.

free(Resource, ResDB)->
    [Resource|ResDB].

