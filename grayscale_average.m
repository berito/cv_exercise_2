% Function: Convert RGB image to grayscale using average method
function gray_img = grayscale_average(rgb_img)
    gray_img = uint8(mean(rgb_img, 3));
end
