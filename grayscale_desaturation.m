% Function: Convert RGB image to grayscale using desaturation method
function gray_img = grayscale_desaturation(rgb_img)
    max_rgb = max(rgb_img, [], 3);
    min_rgb = min(rgb_img, [], 3);
    gray_img = uint8((double(max_rgb) + double(min_rgb)) / 2);
end
