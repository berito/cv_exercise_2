function img_cmyk = rgb2cmyk(img_rgb)
    % Normalize RGB values
    img_rgb = double(img_rgb) / 255.0;

    % Extract RGB channels
    R = img_rgb(:, :, 1);
    G = img_rgb(:, :, 2);
    B = img_rgb(:, :, 3);

    % Calculate CMY components
    C = 1 - R;
    M = 1 - G;
    Y = 1 - B;

    % Calculate K (Key, or black) component
    K = min(C, min(M, Y));

    % Adjust CMY components by subtracting K
    C = (C - K) ./ (1 - K);
    M = (M - K) ./ (1 - K);
    Y = (Y - K) ./ (1 - K);

    % Create CMYK image
    img_cmyk = cat(3, C, M, Y);
end
