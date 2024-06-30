function compare_color_spaces(image_path)
    try
        % Read the image
        img_rgb = imread(image_path);
        
        % Ensure image is uint8
        if ~isa(img_rgb, 'uint8')
            img_rgb = uint8(img_rgb);
        end
        
        % Display the RGB image
        figure('Name', 'RGB Image');
        subplot(1, 3, 1);
        imshow(img_rgb);
        title('RGB');
        % Convert RGB to CMYK (approximate conversion)
        if size(img_rgb, 3) == 3  % Check if image is RGB
            img_cmyk = rgb2cmyk(img_rgb);
            % Display the CMYK image
            subplot(1, 3, 2);
            imshow(img_cmyk);
            title('CMYK');
        
        else
            disp('Image is not RGB. Skipping CMYK conversion.');
        end
        
        % Display grayscale image for comparison
        img_gray = rgb2grayc(img_rgb);
        subplot(1, 3, 3);
        imshow(img_gray);
        title('Grayscale');
        
        % Wait for button press to close the figure
        waitforbuttonpress;
        close(gcf);
        
    catch ME
        fprintf('Error occurred: %s\n', ME.message);
    end
end
