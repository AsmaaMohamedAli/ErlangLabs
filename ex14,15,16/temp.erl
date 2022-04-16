-module(temp).
-export([c2f/1,f2c/1,convert/1]).

c2f(C) ->
   (C*1.8)+32.
f2c(F) ->
    (F-32)*0.55556.

convert({c,0})->
      {c,0};
convert({c,C})->
   {f,(C*1.8)+32};
convert({f, F})->
    {c,(F-32)*0.55556}.
