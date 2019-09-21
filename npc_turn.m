function cards = npc_turn(hc, cards, P)
    s0 = calcScore(P, cards.oppcont, cards.dist, cards.noise);
    sp = calcScore(P, cards.owncont, cards.dist, cards.noise);
    
    best_move_dist = 0;
    best_score_dist = 0;
    for c0 = 1:5
        if (getCardType(cards.opphand(c0)) == 3)
            J = calcScore(P, cards.oppcont, cards.opphand(c0), cards.noise) - s0 ...
                + sp - calcScore(P, cards.owncont, cards.opphand(c0), cards.noise);
            if ( J > best_score_dist )
                best_move_dist = c0;
                best_score_dist = J;
            end
        end
    end
    
    best_move_noise = 0;
    best_score_noise = 0;
    for c0 = 1:5
        if (getCardType(cards.opphand(c0)) == 3)
            J = calcScore(P, cards.oppcont, cards.dist, cards.opphand(c0)) - s0 ...
                + sp - calcScore(P, cards.owncont, cards.dist, cards.opphand(c0));
            if ( J > best_score_noise )
                best_move_noise = c0;
                best_score_noise = J;
            end
        end
    end
    
    best_move_cont0 = 0;
    best_move_cont1 = 0;
    best_score_cont = 0;
    for c0 = 1:5
        for c1 = 1:7
            cont_temp = cards.oppcont;
            cont_temp(c1) = cards.opphand(c0);
            J = calcScore(P, cont_temp, cards.dist, cards.noise) - s0;
            if ( J > best_score_cont )
                best_move_cont0 = c0;
                best_move_cont1 = c1;
                best_score_cont = J;
            end
        end
    end
    
    best_move_player0 = 0;
    best_move_player1 = 0;
    best_score_player = 0;
    for c0 = 1:5
        for c1 = 1:7
            if ( checkPoleZeroCancel(cards.opphand(c0), cards.owncont(c1)) )
                cont_temp = cards.owncont;
                cont_temp(c1) = 0;
                J = sp - calcScore(P, cont_temp, cards.dist, cards.noise);
                if ( J > best_score_player )
                    best_move_player0 = c0;
                    best_move_player1 = c1;
                    best_score_player = J;
                end
            end
        end
    end
    
    [max_score, max_score_idx] = max([best_score_dist, best_score_noise, best_score_cont, best_score_player]);
    card_decktop = cards.deck(1);
    if ( max_score <= 0 )
        c0 = randi([1, 5]);
        cards.oppdisc = cards.opphand(c0);
        cards.opphand(c0) = 0;
        hc.oppdisc.face.LineWidth = 4;
    else
        switch(max_score_idx)
            case 1
                cards.dist = cards.opphand(best_move_dist);
                cards.opphand(best_move_dist) = 0;
                hc.dist.face.LineWidth = 4;
            case 2
                cards.noise = cards.opphand(best_move_noise);
                cards.opphand(best_move_noise) = 0;
                hc.noise.face.LineWidth = 4;
            case 3
                cards.oppcont(best_move_cont1) = cards.opphand(best_move_cont0);
                cards.opphand(best_move_cont0) = 0;
                set(hc.oppcont.face(best_move_cont1), 'LineWidth', 4);
            case 4
                cards.owncont(best_move_player1) = 0;
                cards.opphand(best_move_player0) = 0;
                set(hc.owncont.face(best_move_player1), 'LineWidth', 4);
        end 
    end
    drawCards(hc, cards);
    pause(1);
    cards.opphand(cards.opphand == 0) = card_decktop;
    clearEmph(hc);
    drawCards(hc, cards);
    cards.deck = cards.deck(2:end);
end