function s = calcScore(P, cont, dist, noise)
    K = tf(1);
    for i = 1:7
        K = K * getTf(cont(i));
    end
    
    Kd = getCardParam(dist);
    Kn = getCardParam(noise);
    
    if ( isproper(K) )
        G = (1+P*K)\[-Kn*P*K, Kd*P];

        warning('off', 'all');
        J = norm(G, 2);
        warning('on', 'all');

        if ( isnan(J) )
            s = 0;
        else
            s = 1/J;
        end
    else
        s = 0;
    end
end