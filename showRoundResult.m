function score_board = showRoundResult(hf, P, cards)
    line_width = 1.5;
    col_board = [0 0.5 0];
    col_line = [1 1 1];
    col_own = [0.3010 0.7450 0.9330];
    col_opp = [0.8500 0.3250 0.0980];
    pause(2);
    clf(hf);
    
    score_board = [
        calcScore(P, cards.owncont, cards.dist, cards.noise);
        calcScore(P, cards.oppcont, cards.dist, cards.noise);
    ];

    Kown = tf(1);
    Kopp = tf(1);
    
    for i = 1:7
        Kown = Kown * getTf(cards.owncont(i));
        Kopp = Kopp * getTf(cards.oppcont(i));
    end
    
    [gain, phase, w] = bode(P*[Kown, Kopp]);
    gain = 20*log10(squeeze(gain));
    phase = squeeze(phase);
    
    Kd = getCardParam(cards.dist);
    Kn = getCardParam(cards.noise);

    t = 0:0.01:1000;
    d = Kd * randn(size(t));
    n = Kn * randn(size(t));
    
    ha = subplot(2,2,2);
    semilogx(w, gain(1,:), 'LineWidth', 2, 'Color', col_own);
    hold on;
    semilogx(w, gain(2,:), 'LineWidth', 2, 'Color', col_opp);
    ylabel('gain [dB]', 'FontName', 'Times New Roman', 'FontSize', 16, 'Color', col_line);
    title('$$L(s)=P(s)K(s)$$', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 18, 'Color', col_line);
    grid on;
    set(ha, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);

    ha = subplot(2,2,4);
    semilogx(w, phase(1,:), 'LineWidth', 2, 'Color', col_own);
    hold on;
    semilogx(w, phase(2,:), 'LineWidth', 2, 'Color', col_opp);
    ylabel('phase [deg]', 'FontName', 'Times New Roman', 'FontSize', 16, 'Color', col_line);
    xlabel('frequency [rad/s]', 'FontName', 'Times New Roman', 'FontSize', 16, 'Color', col_line);
    grid on;
    set(ha, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);
    
    ha = subplot(2,2,1, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);
    if ( isproper(Kown) && isstable(feedback(P*Kown,1)) )
        yown = lsim((1+P*Kown)\[-Kn*P*Kown, Kd*P], [n;d], t);
        plot(t, yown, 'LineWidth', 2, 'Color', col_own);
        set(ha, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);
    else
        if ( ~isproper(Kown) )
            text(0.5, 0.5, "IMPROPER", 'FontSize', 36, 'Rotation', 30, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        else
            text(0.5, 0.5, "UNSTABLE", 'FontSize', 36, 'Rotation', 30, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        end
    end
    title(['Score(YOU) = ', num2str(score_board(1))], 'FontSize', 14, 'Color', col_line);
    ylabel('Gaussian noise response', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 16, 'Color', col_line);
    
    ha = subplot(2,2,3, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);
    if ( isproper(Kopp) && isstable(feedback(P*Kopp,1)) )
        yopp = lsim((1+P*Kopp)\[-Kn*P*Kopp, Kd*P], [n;d], t);
        plot(t, yopp, 'LineWidth', 2, 'Color', col_opp);
        set(ha, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);
    else
        if ( ~isproper(Kopp) )
            text(0.5, 0.5, "IMPROPER", 'FontSize', 36, 'Rotation', 30, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        else
            text(0.5, 0.5, "UNSTABLE", 'FontSize', 36, 'Rotation', 30, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        end
    end
    xlabel('time [s]', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 16, 'Color', col_line);
    ylabel('Gaussian noise response', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 16, 'Color', col_line);
    title(['Score(OPPONENT) = ', num2str(score_board(2))], 'FontSize', 14, 'Color', col_line);
    
    pause(1);
    ha_bg = axes(hf, 'XColor', 'none', 'YColor', 'none', 'Color', 'none', 'XTick', [], 'YTick', [], 'Box', 'off', 'XLim', [0 1], 'YLim', [0 1]);
    text(ha_bg, 0.5, 0.5, 'CLICK TO NEXT', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    waitforbuttonpress;
end