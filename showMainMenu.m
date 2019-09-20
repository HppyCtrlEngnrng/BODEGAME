function game_mode = showMainMenu()    
    game_mode = '';
    
    while ~strcmp(game_mode, '0') ... 
            && ~strcmp(game_mode, '1') ... 
            && ~strcmp(game_mode, '2') ...
            && ~strcmp(game_mode, '9')

        clc;
        disp("------------------------------");
        disp("      BODE GAME v 0.0         ");
        disp("                              ");
        disp("  <MENU>                      ");
        disp("   0: START ONLINE (SERVER)   ");
        disp("   1: START ONLINE (CLIENT)   ");
        disp("   2: START OFFLINE           ");
        disp("   9: QUIT                    ");
        disp("------------------------------");

        game_mode = input(">> ", 's');
    end
end