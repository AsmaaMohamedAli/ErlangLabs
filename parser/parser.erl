-module(parser).
-export([start/0]).
-import(lists,[nth/2]).
-include("data.hrl").
start() ->
    {ok, IODevice} = file:open("test.csv", [read]),
    openFile(IODevice).

openFile(IODevice) ->
    case io:get_line(IODevice,"/n") of
        eof  ->
            file:close(IODevice);
        Line ->
            [A, B, C] = string:tokens(Line, ","),
            % [C1]=string:tokens(C,"\n"),
            P = #subscriber_data{msisdn=A,service_class_id = B,bonus=nth(1,string:tokens(C,"\n"))},
            io:format(" the custiomer msisdn: ~p and servise class id : ~p his/her bounse: ~p~n ",[P#subscriber_data.msisdn,
            P#subscriber_data.service_class_id,P#subscriber_data.bonus]),
            openFile(IODevice)
            
    end.
    
            
    
    % re:replace(Line, "\\s+", "", [global,{return,list}]),
   
    
   
    

