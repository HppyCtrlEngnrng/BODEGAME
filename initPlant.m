function P = initPlant()
    P = rss(4);
    P.d = 0;
    
    P = P * sign(P.c/(1e-9-P.a)*P.b);
end