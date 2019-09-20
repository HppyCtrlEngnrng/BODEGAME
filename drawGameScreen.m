function [ha, hc] = drawGameScreen(hf)
    clf(hf);
    card_width = 0.08;
    card_height = 0.12;
    y_owncont = 0.350;
    y_oppcont = 0.650;
    y_ownhand = 0.100;
    y_opphand = 0.900;
    line_width = 1.5;
    col_board = [0 0.5 0];
    col_line = [1 1 1];
    
    function OnCardClick(o, ~)
        global card_clicked;
        card_clicked = o;
    end

    ha.board = axes(hf);
    ha.bode.gain = axes(hf, 'Position', [0.775 0.55 0.200 0.375]);
    semilogx(ha.bode.gain, 1, 'LineWidth', 1, 'Color', col_line);
    ylabel('gain [dB]', 'FontName', 'Times New Roman', 'FontSize', 12, 'Color', col_line);
    grid on;
    ha.bode.phase = axes(hf, 'Position', [0.775 0.1 0.200 0.375]);
    semilogx(ha.bode.phase, 1, 'LineWidth', 1, 'Color', col_line);
    ylabel('phase [deg]', 'FontName', 'Times New Roman', 'FontSize', 12, 'Color', col_line);
    xlabel('frequency [rad/s]', 'FontName', 'Times New Roman', 'FontSize', 12, 'Color', col_line);
    grid on;
    set(ha.bode.gain, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);
    set(ha.bode.phase, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', line_width, 'XColor', col_line, 'YColor', col_line, 'Color', col_board);
    
    pbaspect(ha.board);
    title(ha.bode.gain, '$$L(s)=P(s)K(s)$$', 'Interpreter', 'latex', 'FontName', 'Times New Roman', 'FontSize', 18, 'Color', col_line);

    hold(ha.board, 'on');
    quiver(ha.board, 0.10, y_owncont, 0.165, 0, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.165);
    quiver(ha.board, 0.10, y_oppcont, 0.165, 0, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.165);
    quiver(ha.board, 0.81, y_owncont, 0.165, 0, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.165);
    quiver(ha.board, 0.81, y_oppcont, 0.165, 0, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.165);
    quiver(ha.board, 0.165, 0.560, 0, 0.1, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.1);
    quiver(ha.board, 0.165, 0.440, 0, -0.1, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.1);
    quiver(ha.board, 0.89, 0.560, 0, 0.1, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.1);
    quiver(ha.board, 0.89, 0.440, 0, -0.1, 'LineWidth', line_width, 'Color', col_line, 'MaxHeadSize', 0.1/0.1);
    hold(ha.board, 'off');

    rectangle(ha.board, 'Position', [0.10, 0.210, 1.02, 0.14], 'LineWidth', line_width, 'EdgeColor', col_line);
    rectangle(ha.board, 'Position', [0.10, y_oppcont, 1.02, 0.14], 'LineWidth', line_width, 'EdgeColor', col_line);
    rectangle(ha.board, 'Position', [0.96 y_owncont-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', col_line);
    rectangle(ha.board, 'Position', [0.96 y_oppcont-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', col_line);
    text(ha.board, 1, y_owncont, '$$P(s)$$', 'Interpreter', 'latex', 'Color', col_board, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center');
    text(ha.board, 1, y_oppcont, '$$P(s)$$', 'Interpreter', 'latex', 'Color', col_board, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 180);
    set(ha.board, 'XColor', 'none', 'YColor', 'none', 'Color', [0, 0.5, 0], 'XTick', [], 'YTick', [], 'Box', 'off', 'Position', [0 0 0.80 1], 'XLim', [0 1/0.80], 'YLim', [0 1])
    
    hc.noise.face = rectangle(ha.board, 'Position', [0.125 0.5-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'ButtonDownFcn', @OnCardClick);
    hc.dist.face = rectangle(ha.board, 'Position', [0.850 0.5-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'ButtonDownFcn', @OnCardClick);
    hc.noise.txt = text(ha.board, 0.165, 0.5, '1', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 12, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 180, 'PickableParts', 'none');
    hc.dist.txt = text(ha.board, 0.89, 0.5, '1', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 12, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none');
    text(ha.board, 0.110, 0.5, 'noise', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 90, 'PickableParts', 'none');
    text(ha.board, 0.95, 0.5, 'dist.', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 270, 'PickableParts', 'none');
    
    hc.owncont.face = zeros(1, 7);
    hc.owncont.txt = zeros(1, 7);
    hc.oppcont.face = zeros(1, 7);
    hc.oppcont.txt = zeros(1, 7);
    for i = 1:7
        hc.owncont.face(i) = rectangle(ha.board, 'Position', [0.250+card_width*(i-1) y_owncont-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', [0, 0.5, 0], 'ButtonDownFcn', @OnCardClick);
        hc.oppcont.face(i) = rectangle(ha.board, 'Position', [0.250+card_width*(i-1) y_oppcont-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', [0, 0.5, 0], 'ButtonDownFcn', @OnCardClick);
        hc.owncont.txt(i) = text(ha.board, 0.25+card_width/2+card_width*(i-1), y_owncont, '1', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 12, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none');
        hc.oppcont.txt(i) = text(ha.board, 0.25+card_width/2+card_width*(i-1), y_oppcont, '1', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 12, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 180, 'PickableParts', 'none');
    end
    
    hc.ownhand.face = zeros(1, 5);
    hc.ownhand.txt = zeros(1, 5);
    hc.opphand.face = zeros(1, 5);
    for i = 1:5
        hc.ownhand.face(i) = rectangle(ha.board, 'Position', [0.250+card_width*i y_ownhand-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', [0, 0.5, 0], 'ButtonDownFcn', @OnCardClick);
        hc.opphand.face(i) = rectangle(ha.board, 'Position', [0.250+card_width*i y_opphand-card_height/2 card_width card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', [0, 0.5, 0]);
        hc.ownhand.txt(i) = text(ha.board, 0.25+card_width/2+card_width*i, y_ownhand, '1', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 12, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none');
    end
    
    hc.owndisc.face = rectangle(ha.board, 'Position', [0.850, y_ownhand-card_height/2, card_width, card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', [0, 0.5, 0], 'ButtonDownFcn', @OnCardClick);
    hc.oppdisc.face = rectangle(ha.board, 'Position', [0.125, y_opphand-card_height/2, card_width, card_height], 'Curvature', 0.2, 'LineWidth', 2, 'EdgeColor', col_line, 'FaceColor', [0, 0.5, 0]);
    hc.owndisc.txt = text(ha.board, 0.850+card_width/2, y_ownhand, '1', 'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 12, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none');
    hc.oppdisc.txt = text(ha.board, 0.125+card_width/2, y_opphand, '1',  'Interpreter', 'latex', 'Color', [1 1 1], 'FontSize', 12, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none', 'Rotation', 180);
    
    text(ha.board, 0.25+card_width/2+card_width*3, 0.44, '$$K(s)$$', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none');
    text(ha.board, 0.25+card_width/2+card_width*3, 0.560, '$$K(s)$$', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'Rotation', 180, 'PickableParts', 'none');
    
    text(ha.board, 0.225, 0.325, '$$-$$', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none');
    text(ha.board, 0.225, 0.675, '$$-$$', 'Interpreter', 'latex', 'Color', col_line, 'FontSize', 16, 'VerticalAlignment', 'middle', 'HorizontalAlignment', 'center', 'PickableParts', 'none');
end
