function p = getCardParam(card_id)
    switch(ceil(card_id/18))
        case 0
            p = 1;
        case 1
            p = round(sqrt(10)^(ceil(card_id/2)-3), 1, 'significant');
        case 2
            p = round(sqrt(10)^(ceil((card_id-18)/2)-3), 1, 'significant');
        case 3
            p = round(sqrt(10)^(ceil((card_id-36)/2)-5), 1, 'significant');
    end
end