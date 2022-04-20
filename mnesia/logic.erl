-module(logic).
-export([createTable/0,store_subscriber/1]).
-include("dataRecord.hrl").

createTable()->
    mnesia:create_table(subscriber, [{disc_copies,[node()]},
    {attributes,record_info(fields,subscriber)},{type, bag}]).

store_subscriber(Subscriber)->
   Res=mnesia:dirty_write(Subscriber),
   if 
       Res /="ok" ->
        io:format("exist")
   end.
  
    
