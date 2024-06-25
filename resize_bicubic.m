function resized_img = resize_bicubic(img, scale_factor)
    % Function to resize an image using bicubic interpolation
    % Input:
    %   - img: Input image (RGB or grayscale)
    %   - scale_factor: Scaling factor (e.g., 0.5 for 50% reduction)
    % Output:
    %   - resized_img: Resized image
    
    % Get original image size
    [height, width, channels] = size(img);

    % Compute new dimensions
    new_height = round(height * scale_factor);
    new_width = round(width * scale_factor);

    % Initialize resized image matrix
    resized_img = zeros(new_height, new_width, channels, 'uint8');

    % Perform bicubic interpolation
    for i = 1:new_height
        for j = 1:new_width
            % Coordinates in original image space
            orig_x = i / scale_factor;
            orig_y = j / scale_factor;

            % Find the nearest 4x4 pixels in original image
            x = max(1, floor(orig_x) - 1):min(height, floor(orig_x) + 2);
            y = max(1, floor(orig_y) - 1):min(width, floor(orig_y) + 2);

            % Calculate bicubic interpolation for each channel
            for k = 1:channels
                % Calculate weights for x and y directions
                weights_x = bicubic_weights(orig_x - x);
                weights_y = bicubic_weights(orig_y - y);

                % Extract a 4x4 neighborhood from the image channel
                neighborhood = double(img(x, y, k));

                % Apply bicubic interpolation
                resized_img(i, j, k) = uint8(weights_x * neighborhood * weights_y');
            end
        end
    end
end

function weights = bicubic_weights(x)
    % Calculate bicubic interpolation weights
    a = -0.5;

    % Cubic convolution kernel
    weights = zeros(size(x));
    weights(abs(x) <= 1) = (a + 2) * abs(x(abs(x) <= 1)).^3 - (a + 3) * abs(x(abs(x) <= 1)).^2 + 1;
    weights(abs(x) <= 2 & abs(x) > 1) = a * abs(x(abs(x) <= 2 & abs(x) > 1)).^3 - 5 * a * abs(x(abs(x) <= 2 & abs(x) > 1)).^2 + 8 * a * abs(x(abs(x) <= 2 & abs(x) > 1)) - 4 * a;

    % Ensure weights are within valid range
    weights(weights < 0) = 0;
    weights(weights > 1) = 1;
end
