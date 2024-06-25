function resized_img = resize_bilinear(img, scale_factor)
    [height, width, channels] = size(img);
    new_height = round(height * scale_factor);
    new_width = round(width * scale_factor);
    resized_img = zeros(new_height, new_width, channels, 'uint8');
    % Perform bilinear interpolation
    for i = 1:new_height
        for j = 1:new_width
            % Coordinates in original image space
            orig_x = i / scale_factor;
            orig_y = j / scale_factor;
            % Find the nearest pixels in original image
            x1 = floor(orig_x);
            x2 = min(x1 + 1, height);
            y1 = floor(orig_y);
            y2 = min(y1 + 1, width);

            % Calculate interpolation weights
            dx = orig_x - x1;
            dy = orig_y - y1;

            % Perform bilinear interpolation for each channel
            for k = 1:channels
                top = img(x1, y1, k) * (1 - dx) + img(x2, y1, k) * dx;
                bottom = img(x1, y2, k) * (1 - dx) + img(x2, y2, k) * dx;
                resized_img(i, j, k) = uint8(top * (1 - dy) + bottom * dy);
            end
        end
    end
end
