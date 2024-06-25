function cropped_img = crop_image(img, top_left, bottom_right)
    img = im2double(img);
    % Extract coordinates
    x1 = top_left(1);
    y1 = top_left(2);
    x2 = bottom_right(1);
    y2 = bottom_right(2);
    width = x2 - x1 + 1;
    height = y2 - y1 + 1;
    % Perform cropping
    cropped_img = img(y1:y2, x1:x2, :);

end





