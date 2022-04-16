-module(iter).
-export([sum/1]).

% for(N) when N>=0 ,is_integer(N)->
%     loop(1,N),
%     sum(1,N).

% sum(I,N) when I>N ->
%     0;
% sum(I,N) ->
%     I+sum(I+1,N).
   
% loop(I,N) when I>N  ->
%           done; 
% loop(I,N)->
%      io:format("~p~n",[I]),
%      loop(I+1,N).
%+++++++++++++++++++++++onter solution
sum(N) ->
    sum(N, 0).

sum(0, Sum) ->
    io:format("sum= ~p~n",[Sum]);
sum(N, Sum) ->
    io:format("~p~n",[N]),
    sum(N-1, N+Sum).
