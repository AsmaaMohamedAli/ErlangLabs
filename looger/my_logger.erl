-module(my_logger).
-export([start/0,init/0]).

start()->
    spawn(my_logger,init,[]).
init()->
    register(mylogger, self()),
    {ok,ErlangTerm} = file:consult("configurations.txt"),
    {ok,IODevice}=openFile(lists:nth(2, ErlangTerm),lists:nth(1, ErlangTerm)),
    logger(ErlangTerm,IODevice).


logger([Dir,FileName,Size,Time],IODevice)->

    receive
        {admin, stop}->

            io:format("looger process terminates ~n"),
            true;

        {admin, reload_config}->

            {ok,ErlangTerm} = file:consult("configurations.txt"),
            logger(ErlangTerm,IODevice);
            
        Msg->
            
            io:format(IODevice, "~s~n", [Msg]),
            {ok,ErlangTerm} = file:consult("configurations.txt"),
            logger(ErlangTerm,IODevice)
    after
        Time ->
            io:format("looger process terminates ~n"),
            true

    end.

openFile(Name,Dir)->

    {ok, Filenames}=file:list_dir(Dir),
    case Filenames of 
        []->
            Count=1,
             file:open(string:concat(Name,Count++".log"), [write]);
        _ ->
            Count=lists:length(Filenames),
            file:open(Name++Count++".log", [write])  
    end. 


    