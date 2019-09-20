function clearEmph(hc)
    for i = 1:5
        set(hc.ownhand.face(i), 'LineWidth', 2);
        set(hc.opphand.face(i), 'LineWidth', 2);
        set(hc.ownhand.face(i), 'EdgeColor', [1 1 1]);
        set(hc.opphand.face(i), 'EdgeColor', [1 1 1]);
    end
    
    for i = 1:7
        set(hc.owncont.face(i), 'LineWidth', 2);
        set(hc.oppcont.face(i), 'LineWidth', 2);
        set(hc.owncont.face(i), 'EdgeColor', [1 1 1]);
        set(hc.oppcont.face(i), 'EdgeColor', [1 1 1]);
    end
    
    hc.dist.face.LineWidth = 2;
    hc.noise.face.LineWidth = 2;
    hc.dist.face.EdgeColor = [1 1 1];
    hc.noise.face.EdgeColor = [1 1 1];
    hc.owndisc.face.LineWidth = 2;
    hc.oppdisc.face.LineWidth = 2;
end