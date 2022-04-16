-module(recursion_over_lists).
-export([nth/2,subList/2]).

nth(Index,List) when is_list(List),length(List)>0,Index=<length(List) ->
    loop(Index,List).

loop(1,[H|_])->
    H;
loop(I,[_|T]) ->
    loop(I-1,T).

subList(L,N) when is_list(L),length(L)>0,N=<length(L) ->
    subList2(L,N).

%+++++++++++++++++for the last element i will return list of on item
subList2([H|[]],1)->
    [H];
subList2([H|T],1)->
    F=H,
    [A|_]=T,
    [F,A];
subList2([_|T],I)->
   subList2(T,I-1).
  



