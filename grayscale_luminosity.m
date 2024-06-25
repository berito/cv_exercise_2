% Function to convert RGB image to grayscale using luminosity method
function gray_img = grayscale_luminosity(rgb_img)
    % Ensure rgb_img is double precision for accurate calculation
    rgb_img = im2double(rgb_img);
    
    % Luminosity method weights
    weights = [0.21, 0.72, 0.07];

    % Compute grayscale image using weighted sum
    gray_img = rgb_img(:,:,1) * weights(1) + ...
               rgb_img(:,:,2) * weights(2) + ...
               rgb_img(:,:,3) * weights(3);
end
