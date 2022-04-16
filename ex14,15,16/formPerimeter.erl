-module(formPerimeter).
-export([form_perimeter/1]).


form_perimeter({square,S})->
    S*4;
form_perimeter({circle,R})->
    2*R*3.14;
form_perimeter({triangel,A,B,C})->
    A+B+C;
form_perimeter({_,_})->
    io:format("forms shloud be square or triangel or circle").

% -export([square/1,circle/1,triangel/1]).
% square(S) ->
%     S*4.
% circle(R) ->
%     2*R*3.14.

% triangel(A,B,C)->
%     A+B+C.    
          
