function showTotalResult(hf, score_board)
    clf(hf);
    ha = axes(hf, 'XColor', 'none', 'YColor', 'none', 'Color', [0 0.5 0], 'Box', 'off', 'Position', [0 0 1 1], 'XLim', [0 1], 'YLim', [0 1]);
    text(ha, 0.5, 0.9, 'SCORE', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 24, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    
    text(ha, 0.50, 0.80, 'YOU', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, 0.75, 0.80, 'OPPONENT', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');

    for r = 1:4
        text(ha, 0.25, 0.65-0.05*(r-1), ['Round ', num2str(r, 1)], 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        text(ha, 0.50, 0.65-0.05*(r-1), num2str(score_board(1, r)), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
        text(ha, 0.75, 0.65-0.05*(r-1), num2str(score_board(2, r)), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    end
    
    text(ha, 0.25, 0.3, 'TOTAL', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, 0.50, 0.3, num2str(sum(score_board(1,:))), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha, 0.75, 0.3, num2str(sum(score_board(2,:))), 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 18, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    
    if ( sum(score_board(1,:)) > sum(score_board(2,:)) )
        str_result = 'YOU WIN';
    else
        str_result = 'YOU LOSE';
    end
    
    text(ha, 0.5, 0.2, str_result, 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 36, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
end