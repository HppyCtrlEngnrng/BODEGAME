function plotBode(ha, P, cont)
    L = P;
    for i = 1:7
        L = L * getTf(cont(i));
    end
    
    [gain, phase, w] = bode(L);
    
    set(ha.gain.Children, 'XData', w, 'YData', 20*log10(squeeze(gain)));
    set(ha.phase.Children, 'XData', w, 'YData', squeeze(phase));
    
    drawnow;
end