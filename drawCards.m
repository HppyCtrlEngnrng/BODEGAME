function drawCards(hc, cards)
    drawOwnHand(hc.ownhand, cards.ownhand);
    drawOppHand(hc.opphand, cards.opphand);
    drawOwnCont(hc.owncont, cards.owncont);
    drawOppCont(hc.oppcont, cards.oppcont);
    drawDist(hc.dist, cards.dist);
    drawNoise(hc.noise, cards.noise);
    drawDisc(hc.owndisc, cards.owndisc);
    drawDisc(hc.oppdisc, cards.oppdisc);
    
    drawnow;
end

function drawOwnHand(hc, ownhand)
    for i = 1:5
        set(hc.face(i), 'FaceColor', getCardColor(ownhand(i)));
        set(hc.txt(i), 'String', getTfString(ownhand(i)));
    end
end

function drawOppHand(hc, opphand)
    for i = 1:5
        set(hc.face(i), 'FaceColor', getCardColor(opphand(i)));
    end
end

function drawOwnCont(hc, owncont)
    for i = 1:7
        set(hc.face(i), 'FaceColor', getCardColor(owncont(i)));
        set(hc.txt(i), 'String', getTfString(owncont(i)));
    end
end

function drawOppCont(hc, oppcont)
    for i = 1:7
        set(hc.face(i), 'FaceColor', getCardColor(oppcont(i)));
        set(hc.txt(i), 'String', getTfString(oppcont(i)));
    end
end

function drawDist(hc, dist)
    hc.face.FaceColor = getCardColor(dist);
    set(hc.txt, 'String', getTfString(dist));
end

function drawNoise(hc, noise)
    hc.face.FaceColor = getCardColor(noise);
    set(hc.txt, 'String', getTfString(noise));
end

function drawDisc(hc, disc)
    hc.face.FaceColor = getCardColor(disc);
    set(hc.txt, 'String', getTfString(disc));
end
