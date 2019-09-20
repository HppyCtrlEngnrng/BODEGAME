function drawScore(hf, score_board, is_first, rnd)
    clf(hf);
    ha = axes(hf, 'XColor', 'none', 'YColor', 'none', 'Color', [0 0.5 0], 'Box', 'off', 'Position', [0 0 1 1], 'XLim', [0 1], 'YLim', [0 1]);
    text(ha, 0.5, 0.9, ['ROUND ' num2str(rnd)], 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 24, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    
    if ( is_first )
        x_you = 0.50;
        x_opp = 0.75;
    else
        x_you = 0.75;
        x_opp = 0.50;
    end
    
    text(ha, 0.50, 0.80, 'YOU', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, 0.75, 0.80, 'OPPONENT', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, x_you, 0.75, '(FIRST)', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, x_opp, 0.75, '(SECOND)', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    
    for r = 1:rnd-1
        text(ha, 0.25, 0.65-0.05*(r-1), ['Round ', num2str(r, 1)], 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        text(ha, 0.50, 0.65-0.05*(r-1), num2str(score_board(1, r)), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        text(ha, 0.75, 0.65-0.05*(r-1), num2str(score_board(2, r)), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    end
    
    text(ha, 0.25, 0.65-0.05*(rnd-1), ['Round ', num2str(rnd, 1)], 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, 0.25, 0.3, 'TOTAL', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, 0.50, 0.3, num2str(sum(score_board(1,1:rnd-1))), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, 0.75, 0.3, num2str(sum(score_board(2,1:rnd-1))), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    
    pause(1);
    text(ha, 0.5, 0.2, 'CLICK TO START', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    waitforbuttonpress;
end