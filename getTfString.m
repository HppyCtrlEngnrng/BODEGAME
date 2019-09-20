function s = getTfString(card_id)
    p = num2str(getCardParam(card_id));
    switch(ceil(card_id/18))
        case 0
            s = '1';
        case 1
            s = ['$$\frac{', p, '+s}{', p, '}$$'];
        case 2
            s = ['$$\frac{', p, '}{', p, '+s}$$'];
        case 3
            s = ['$$', p, '$$'];
    end
end