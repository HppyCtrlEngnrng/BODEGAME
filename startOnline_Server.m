function startOnline_Server()
    tcp = getTcpIf_Server();
    is_first = true;
    score_board = zeros(2, 4);
    rng('default');
    
    hf = figure('MenuBar', 'none', 'OuterPosition', [100, 100, 1280, 720], 'Resize', 'off', 'Name', 'BODE GAME', 'NumberTitle', 'off', 'Color', [0, 0.5, 0]);
    for r = 1:4
        drawScore(hf, score_board, is_first, r);
        
        rng('shuffle', 'twister');
        sndInitCond(tcp, rng().Seed);
        
        cards = initCards(is_first);
        P = initPlant();
        
        [ha, hc] = drawGameScreen(hf);
        drawCards(hc, cards);
        plotBode(ha.bode, P, cards.owncont);
        
        ht_turn = text(ha.board, 0.5, 0.5, '', 'Color', [1 1 1], 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        
        for turn = 1:10
            drawTurnInd(ht_turn, turn);
            if ( is_first )
                [cards, c0, c1_addr] = your_turn(hc, cards);
                sndYourAction_Server(tcp, c0, c1_addr);
                plotBode(ha.bode, P, cards.owncont);
                [c0, c1_addr] = rcvClientAction(tcp);
                cards = drawOpponentAction(hc, cards, c0, c1_addr);
            else
                [c0, c1_addr] = rcvClientAction(tcp);
                cards = drawOpponentAction(hc, cards, c0, c1_addr);
                [cards, c0, c1_addr] = your_turn(hc, cards);
                sndYourAction_Server(tcp, c0, c1_addr);
                plotBode(ha.bode, P, cards.owncont);
            end
        end
        
        score_board(:,r) = showRoundResult(hf, P, cards);
        is_first = ~is_first;
    end
    
    showTotalResult(hf, score_board);
    fclose(tcp);
end

function tcp = getTcpIf_Server()
    while(1)
        ip = input("ip addr? >> ", 's');
        port = str2double(input("port? >> ", 's'));
        
        if ( ischar(ip) && isnumeric(port) )
            break;
        end
    end
    
    tcp = tcpip(ip, port, 'NetworkRole', 'server');
    disp('Waiting connection from the client...');
    fopen(tcp);
    disp('Connected!');
    if ( tcp.BytesAvailable ~= 0 )
        fread(tcp);
    end
end

function sndInitCond(tcp, r_seed)
    fwrite(tcp, typecast(r_seed, 'uint8'));
end

function sndYourAction_Server(tcp, c0, c1_addr)
    fwrite(tcp, uint8([c0, c1_addr]));
end

function [c0, c1_addr] = rcvClientAction(tcp)
    while (tcp.BytesAvailable == 0)
        pause(0.1);
    end
    
    buf = fread(tcp, tcp.BytesAvailable);
    c0 = buf(1);
    c1_addr = buf(2);
end