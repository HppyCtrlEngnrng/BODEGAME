function drawTurnInd(ht, turn)
    ht.String = 'TURN ';
    
    for t = 1:turn
        ht.String = [ht.String, '��'];
    end
    
    for t = turn+1:10
        ht.String = [ht.String, '��'];
    end
end