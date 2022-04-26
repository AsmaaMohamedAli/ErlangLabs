
-module(day_night_events).

-behaviour(gen_statem).

%% API
-export([start_link/0, add_handler/0]).

%% gen_event callbacks
-export([init/1,day/2,night/2, handle_event/2, handle_call/2, 
	 handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE). 




start_link() ->
    gen_statem:start_link({local,?SERVER},?MODULE, [], []).

%%--------------------------------------------------------------------
%% @doc
%% Adds an event handler
%%
%% @spec add_handler() -> ok | {'EXIT', Reason} | term()
%% @end
%%--------------------------------------------------------------------
add_handler() ->
    gen_event:add_handler(?SERVER, ?MODULE, []).

%%%===================================================================
%%% gen_event callbacks
%%%===================================================================

init([]) ->
    io:format("day_night_events now is starting ++ day started~n"),
    {ok,day,[]}.

day(_EventType,sunRise,State)->
    io:format("Now is Day~n"),
    {keep_state,[day|State]};

day(_EventType,sunSet,State)->
    io:format("Now is Night~n"),
    {next_state, night,[night|State]};
    

day(_EventType,show_info,State)->
    io:format("StateData Info ~p~n",[State]),
    {keep_state,[State]};

day(_EventType,_Event,State)->
    io:format("up normal event ~n"),
    {keep_state,[upNormal|State]}.


night(_EventType,sunRise,State)->
    io:format("Now is Day~n"),
    {next_state,day,[day|State]};

night(_EventType,sunSet,State)->
    io:formate("Now is Night~n"),
    {keep_state,[night|State]};
    
day(_EventType,show_info,State)->
    io:format("StateData Info ~p~n",[State]),
    {keep_state,[State]};

night(_EventType,_Event,State)->
    io:format("up normal event ~n"),
    {keep_state,[upNormal|State]}.

    






handle_event(_Event, State) ->
    {ok, State}.

handle_call(_Request, State) ->
    Reply = ok,
    {ok, Reply, State}.

handle_info(_Info, State) ->
    {ok, State}.


terminate(_Reason, _State) ->
    ok.


code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
