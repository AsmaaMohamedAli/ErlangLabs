-module(logic).
-export([createTable/0,store_subscriber/1,print_all/0]).
-include("dataRecord.hrl").

createTable()->
    mnesia:create_schema([node()]),
    mnesia:start(),
    mnesia:create_table(subscriber, [{disc_copies,[node()]},
    {attributes,record_info(fields,subscriber)},{type, set}]).


store_subscriber({Sub_id,Account_id,Last_deduction_date,Next_deduction_date,Installments_remaining,Installments_completed})->
   P=#subscriber{  
      sub_id=Sub_id,
      account_id=Account_id,
      last_deduction_date=Last_deduction_date,
      next_deduction_date=Next_deduction_date,
      installments_remaining=Installments_remaining,
      installments_completed=Installments_completed
      },
     mnesia:dirty_write(P).
   
       
     
    lookuSubscribers(Id)->
        mnesia:dirty_read(subscriber,Id). 
    print_all()->
        mnesia:dirty_select(subscriber, [{'_',[],['$_']}]).


    
