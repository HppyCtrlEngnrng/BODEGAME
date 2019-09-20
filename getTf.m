function G = getTf(card_id)
    p = getCardParam(card_id);
    switch(ceil(card_id/18))
        case 0
            G = tf(1);
        case 1
            G = tf([1 p], p);
        case 2
            G = tf(p, [1 p]);
        case 3
            G = tf(p);
    end
end