function resized_img = resize_image(img, new_width)
    % Determine the current dimensions of the image
    [rows, cols, ~] = size(img);

    % Calculate new height to maintain aspect ratio
    new_height = round(rows * (new_width / cols));

    % Compute scaling factors
    scale_x = new_width / cols;
    scale_y = new_height / rows;

    % Generate grids of indices for the new image
    [X, Y] = meshgrid(1:new_width, 1:new_height);

    % Compute corresponding coordinates in the original image
   
    orig_X = X / scale_x;
    orig_Y = Y / scale_y;

    % Initialize resized image matrix
    resized_img = zeros(new_height, new_width, size(img, 3));

    % Perform bilinear interpolation for each color channel
    for k = 1:size(img, 3)
        % Interpolate using nearest neighbor
        resized_img(:,:,k) = interp2(double(img(:,:,k)), orig_X, orig_Y, 'linear', 0);
    end

    % Convert resized image back to uint8 format
    resized_img = uint8(resized_img);
end
