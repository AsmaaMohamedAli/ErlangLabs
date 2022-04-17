-module(recursion_over_lists).
-export([nth/2,subList/2,seq/2]).
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++2B
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

seq(Low,High) when is_integer(Low), is_integer(High) ->
    seq1(Low,High,[]).

seq1(L,H,List) when L=<H->
    seq1(L+1,H,[L|List]);
seq1(_,_,L)->
    lists:reverse(L).
    

     




%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++2C
 

  



