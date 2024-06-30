function img_gray = rgb2grayc(img_rgb)
    % Check if the input image is RGB
    if size(img_rgb, 3) == 3
        % Convert RGB to grayscale using luminance method
        img_gray = 0.2989 * img_rgb(:,:,1) + 0.5870 * img_rgb(:,:,2) + 0.1140 * img_rgb(:,:,3);
    else
        % If the input image is already grayscale, return it as is
        img_gray = img_rgb;
    end
end
