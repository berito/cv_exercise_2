function resized_img = resize_nearest_neighbor(img, scale_factor)
    [height, width, channels] = size(img);
    new_height = round(height * scale_factor);
    new_width = round(width * scale_factor);
    resized_img = zeros(new_height, new_width, channels, 'uint8');
    for i = 1:new_height
        for j = 1:new_width
            orig_x = round(i / scale_factor);
            orig_y = round(j / scale_factor);

            % Clamp indices to image bounds
            orig_x = max(1, min(height, orig_x));
            orig_y = max(1, min(width, orig_y));

            resized_img(i, j, :) = img(orig_x, orig_y, :);
        end
    end
end
