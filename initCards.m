function cards = initCards(is_first)
    c = randsample(54, 54);
    
    cards.dist = 0;
    cards.noise = 0;
    
    if ( is_first )
        cards.ownhand = c(1:5);
        cards.opphand = c(6:10);
    else
        cards.opphand = c(1:5);
        cards.ownhand = c(6:10);
    end
    
    cards.owncont = zeros(1, 7);
    cards.oppcont = zeros(1, 7);
    cards.owndisc = 0;
    cards.oppdisc = 0;
    cards.deck = c(11:end);
end