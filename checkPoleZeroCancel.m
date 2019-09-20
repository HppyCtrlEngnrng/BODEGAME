function b = checkPoleZeroCancel(c1, c2)
    if ( (getCardType(c1) == 1 && getCardType(c2) == 2) ...
            || (getCardType(c1) == 2 && getCardType(c2) == 1) )
        if ( mod(ceil(c1/2)-1,9) == mod(ceil(c2/2)-1,9) )
            b = true;
        else
            b = false;
        end
    else
        b = false;
    end
end