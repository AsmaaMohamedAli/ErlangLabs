-module(test).
-export([loop/0]).
%+++++++++++++++++++++++++++++++++++++++++++++loop from 0 To certin number
% for(N) when N>=0 ,is_integer(N)->
%      loop(0,N).
% loop(I,N) when I>N  ->
%           done; 
% loop(I,N)->
%      io:format("~p~n",[I]),
%      loop(I+1,N).
%++++++++++++++++++++++++++++++++++++++++++++++++++ diplay each elment in list
% display([])->
%      done;

% display([H|T])->
%      io:format("~p~n", [H]),
%      display(T).
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ average of list elemnts

% average(N) when is_list(N),length(N)>0 ->
%      sum(N)/len(N).
% sum([H|T])->
%      H+sum(T);
% sum([])->
%      0.
% len([H|T])->
%      1+len(T);
% len([])->
%      0.
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ double list elements
% double(N) when is_list(N),length(N)>0 ->
%      logic(N).
% logic([H|T])->
%      [2*H|logic(T)];
% logic([])->
%      [].
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++ search about element in list
% search(X,List) when is_list(List),length(List)>0 ->
%      member(X,List).

% member(H, [H | _ ]) ->
%      true;
% member(H, [_|T]) ->
%      member(H,T);
% member(_,[]) ->
%      false.
%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++ using accumulators to avoid consumes memory
% double(List) when is_list(List),length(List)>0 ->
%      double_2(List, []).
% double_2([H|T], NewList)->
%      double_2(T, [2*H|NewList]);
% double_2([], NewList) ->
%      lists:reverse(NewList).
%++++++++++++++++++++++++++++++++++++++++++++++ proccese demoo
% start()->
%      io:format("~p~n",[self()]),
%      spawn(test,print,[]),
%      ok.
% print()->
%      io:format("~p~n",[self()]).
     
%++++++++++++++++++++++++++++++++++++++++++++++++++  send message to proceess
% start()->
%      spawn(test,wait,[]).

% wait()->
%      receive
%           Msg->
%                io:format("~p~n",[Msg]),
%                wait()
%      end.
%++++++++++++++++++++++++++++++++++++++++++++++++++++++ stop message
% start()->
%      spawn(test,wait,[]).

% wait()->
%      receive
%           stop->
%                terminated;
%           Msg->
%                io:format("~p~n",[Msg]),
%                wait()
%      end.
%++++++++++++++++++++++++++++++++++++++++++++++ server_areaa
% loop() ->
%      receive
%           {rectangle, Width, Ht} ->
%                io:format("Area of rectangle is ~p~n",
%                [Width * Ht]),
%                loop();
%           {circle, R} ->
%                io:format("Area of circle is ~p~n" , [3.14159 * R
%                * R]),
%                loop();
%           Other ->
%                io:format("I don't know what the area of a ~p is
%                ~n" ,[Other]),
%                loop()
% end.          
%++++++++++++++++++++++++++++++++++++++++++++++++++++++ sleeep(time out)

% sleep(T)->
%      receive
%           after
%                T->
%                     io:format("time out ~n")
%      end.
%++++++++++++++++++++++++++++++++++++++++++++++++++ normal and up normal exit
loop() ->
receive
     stop ->
          io:format("Process stopped~n");
     error ->
          io:format("Process will terminate
          ubnormally~n"),
          exit(self(),kill);
     Msg ->
          io:format("Message ~p received ~n", [Msg]),
          loop()
end.




     








