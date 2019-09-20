function c = getCardColor(card_id)
    switch(ceil(card_id/18))
        case 0
            c = [0, 0.5, 0];
        case 1
            c = [0, 0.4470, 0.7410];
        case 2
            c = [0.8500, 0.3250, 0.0980];
        case 3
            c = [0.9290, 0.6940, 0.1250];
    end
end