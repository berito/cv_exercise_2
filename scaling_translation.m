function adjusted_image = scaling_translation(image_path, scale_factor, translation)
    try
        % Read the image
        img = imread(image_path);
        
        % Ensure image is double precision for accurate calculations
        img = double(img);
        
        % Apply scaling operation
        scaled_img = img * scale_factor;
        
        % Apply translation operation (additive)
        translated_img = scaled_img + translation;
        
        % Ensure pixel values are within valid range [0, 255] (uint8)
        adjusted_image = uint8(translated_img);
        
        % Display original and adjusted images for comparison
        figure;
        subplot(1, 2, 1);
        imshow(uint8(img));
        title('Original Image');
        
        subplot(1, 2, 2);
        imshow(adjusted_image);
        title(sprintf('Adjusted Image\nScale Factor: %.2f, Translation: %d', scale_factor, translation));
         waitforbuttonpress;
        close(gcf);
    catch ME
        fprintf('Error: %s\n', ME.message);
        adjusted_image = [];  % Return empty if there's an error
    end
end
