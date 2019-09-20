function bodegame()
    while(1)
        game_mode = showMainMenu();
        
        switch(game_mode)
            case '0'
                startOnline_Server();
            case '1'
                startOnline_Client();
            case '2'
                startOffline();
            case '9'
                break;
        end
    end
end