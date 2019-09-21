function [cards, c0, c1_addr] = your_turn(hc, cards)
    global card_clicked;
    state = 0;
    
    while (1)
        switch (state)
            case 0
                emphOwnHand(hc);
                card_clicked = -1;
                waitforbuttonpress;
                c0 = find(hc.ownhand.face == card_clicked, 1);
                
                if (~isempty(c0))
                    set(hc.ownhand.face(c0), 'EdgeColor', [0.6350 0.0780 0.1840]);
                    state = 1;
                end
            case 1
                emphReplCand(hc, cards, c0);
                card_clicked = -1;
                waitforbuttonpress;
                if ( ~isempty(find(hc.ownhand.face == card_clicked, 1)) )
                    c1 = find(hc.ownhand.face == card_clicked, 1);
                    set(hc.ownhand.face(c0), 'EdgeColor', [1 1 1]);
                    set(hc.ownhand.face(c1), 'EdgeColor', [0.6350 0.0780 0.1840]);
                    c0 = c1;
                elseif ( ~isempty(find(hc.owncont.face == card_clicked, 1)) )
                    c1 = find(hc.owncont.face == card_clicked, 1);
                    if ( cards.owncont(c1) ~= 0 )
                        cards.owndisc = cards.owncont(c1);
                    end
                    cards.owncont(c1) = cards.ownhand(c0);
                    cards.ownhand(c0) = 0;
                    c1_addr = c1;
                    state = 2;
                elseif ( ~isempty(find(hc.oppcont.face == card_clicked, 1)) )
                    c1 = find(hc.oppcont.face == card_clicked, 1);
                    if ( checkPoleZeroCancel(cards.ownhand(c0), cards.oppcont(c1)) )
                        cards.owndisc = cards.oppcont(c1);
                        cards.oppcont(c1) = 0;
                        cards.ownhand(c0) = 0;
                        c1_addr = 7 + c1;
                        state = 2;
                    end
                elseif ( hc.dist.face == card_clicked )
                    if ( getCardType(cards.ownhand(c0)) == 3 )
                        cards.dist = cards.ownhand(c0);
                        cards.ownhand(c0) = 0;
                        c1_addr = 15;
                        state = 2;
                    end
                elseif ( hc.noise.face == card_clicked )
                    if ( getCardType(cards.ownhand(c0)) == 3 )
                        cards.noise = cards.ownhand(c0);
                        cards.ownhand(c0) = 0;
                        c1_addr = 16;
                        state = 2;
                    end
                elseif ( hc.owndisc.face == card_clicked )
                    cards.owndisc = cards.ownhand(c0);
                    cards.ownhand(c0) = 0;
                    c1_addr = 17;
                    state = 2;
                end
            case 2
                drawCards(hc, cards);
                pause(1);
                cards.ownhand(c0) = cards.deck(1);
                cards.deck = cards.deck(2:end);
                clearEmph(hc);
                drawCards(hc, cards);
                break;
        end
    end
end

function emphReplCand(hc, cards, c)
    switch ( ceil(cards.ownhand(c)/18) )
        case 1
            for i = 1:7
                set(hc.owncont.face(i), 'LineWidth', 4);
                if ( checkPoleZeroCancel(cards.ownhand(c), cards.oppcont(i)) )
                    set(hc.oppcont.face(i), 'LineWidth', 4);
                else
                    set(hc.oppcont.face(i), 'LineWidth', 2);
                end
            end
            hc.dist.face.LineWidth = 2;
            hc.noise.face.LineWidth = 2;
            hc.owndisc.face.LineWidth = 4;
        case 2
            for i = 1:7
                set(hc.owncont.face(i), 'LineWidth', 4);
                if ( checkPoleZeroCancel(cards.ownhand(c), cards.oppcont(i)) )
                    set(hc.oppcont.face(i), 'LineWidth', 4);
                else
                    set(hc.oppcont.face(i), 'LineWidth', 2);
                end
            end
            hc.dist.face.LineWidth = 2;
            hc.noise.face.LineWidth = 2;
            hc.owndisc.face.LineWidth = 4;
        case 3
            for i = 1:7
                set(hc.owncont.face(i), 'LineWidth', 4);
                set(hc.oppcont.face(i), 'LineWidth', 2);
            end
            hc.dist.face.LineWidth = 4;
            hc.noise.face.LineWidth = 4;
            hc.owndisc.face.LineWidth = 4;
    end
end

function emphOwnHand(hc)
    for i = 1:5
        set(hc.ownhand.face(i), 'LineWidth', 4);
        set(hc.opphand.face(i), 'LineWidth', 2);
        set(hc.ownhand.face(i), 'EdgeColor', [1 1 1]);
        set(hc.opphand.face(i), 'EdgeColor', [1 1 1]);
    end
    
    for i = 1:7
        set(hc.owncont.face(i), 'LineWidth', 2);
        set(hc.oppcont.face(i), 'LineWidth', 2);
    end
    
    hc.dist.face.LineWidth = 2;
    hc.noise.face.LineWidth = 2;
end