function cards = drawOpponentAction(hc, cards, c0, c1_addr)
    if ( c1_addr <= 7 )
        c1 = c1_addr;
        cards.oppcont(c1) = cards.opphand(c0);
        set(hc.oppcont.face(c1), 'LineWidth', 4);
    elseif ( c1_addr <= 14 )
        c1 = c1_addr - 7;
        cards.owncont(c1) = cards.opphand(c0);
        set(hc.owncont.face(c1), 'LineWidth', 4);
    elseif ( c1_addr == 15 )
        cards.dist = cards.opphand(c0);
        hc.dist.face.LineWidth = 4;
    elseif ( c1_addr == 16 )
        cards.noise = cards.opphand(c0);
        hc.noise.face.LineWidth = 4;
    elseif ( c1_addr == 17 )
        cards.oppdisc = cards.opphand(c0);
        hc.oppdisc.face.LineWidth = 4;
    end
    cards.opphand(c0) = 0;
    drawCards(hc, cards);
    pause(1);
    cards.opphand(c0) = cards.deck(1);
    cards.deck = cards.deck(2:end);
    clearEmph(hc);
    drawCards(hc, cards);
end