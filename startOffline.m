function startOffline()
    is_first = true;
    score_board = zeros(2, 4);
    
    hf = figure('MenuBar', 'none', 'OuterPosition', [100, 100, 1280, 720], 'Resize', 'off', 'Name', 'BODE GAME', 'NumberTitle', 'off', 'Color', [0, 0.5, 0]);
    for r = 1:4
        rng('shuffle');
        drawScore(hf, score_board, is_first, r);
        cards = initCards(is_first);
        P = initPlant();
        
        [ha, hc] = drawGameScreen(hf);
        drawCards(hc, cards);
        plotBode(ha.bode, P, cards.owncont);
        
        ht_turn = text(ha.board, 0.5, 0.5, '', 'Color', [1 1 1], 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        
        for turn = 1:10
            drawTurnInd(ht_turn, turn);
            if ( is_first )
                cards = your_turn(hc, cards);
                plotBode(ha.bode, P, cards.owncont);
                cards = npc_turn(hc, cards, P);
            else
                cards = npc_turn(hc, cards, P);
                cards = your_turn(hc, cards);
                plotBode(ha.bode, P, cards.owncont);
            end
        end
        
        score_board(:,r) = showRoundResult(hf, P, cards);
        is_first = ~is_first;
    end
    
    showTotalResult(hf, score_board);
end
