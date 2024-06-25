directory="./images/"
% import_display_images(directory);

% ===== resize image=======:
function image_resize()
    filename = './images/Tomato___Bacterial_spot.JPG';  
    new_width = 400;  
    original_img = imread(filename);
    resized_img = resize_image(original_img, new_width);
    display_images(original_img, resized_img);
end

% ======  grayscale_conversion==========
function gray_scale_test()
    % Display original and grayscale images
    filename = './images/Tomato___Bacterial_spot.JPG';  
    rgb_img = imread(filename);
    % Call grayscale conversion functions
    gray_avg = grayscale_average(rgb_img);
    gray_lum = grayscale_luminosity(rgb_img);
    gray_des = grayscale_desaturation(rgb_img);
    figure;
    subplot(2, 2, 1);
    imshow(rgb_img);
    title('Original Image');

    subplot(2, 2, 2);
    imshow(gray_avg);
    title('Grayscale (Average Method)');

    subplot(2, 2, 3);
    imshow(gray_lum);
    title('Grayscale (Luminosity Method)');

    subplot(2, 2, 4);
    imshow(gray_des);
    title('Grayscale (Desaturation Method)');
    waitforbuttonpress;
    close(gcf);
end 
function get_crop_image()
    filename = './images/Tomato___Bacterial_spot.JPG';  
    img = imread(filename);
    top_left = [50, 50];           
    bottom_right = [100, 100];     
    cropped_img = crop_image(img, top_left, bottom_right);
    figure;
    subplot(1, 2, 1);
    imshow(img);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(cropped_img);
    title('Cropped Image');
    waitforbuttonpress;
    close(gcf);
end
function compare_interpolation_techniques()
  
    filename = './images/Tomato___Bacterial_spot.JPG';    
    scale_factor = 0.5;          

    % Read the image
    img = imread(filename);

    % Resize using different interpolation techniques
    resized_nearest = resize_nearest_neighbor(img, scale_factor);
    resized_bilinear = resize_bilinear(img, scale_factor);
    resized_bicubic = resize_bicubic(img, scale_factor);

    % Display original and resized images
    figure;
    subplot(2, 2, 1);
    imshow(img);
    title('Original Image');

    subplot(2, 2, 2);
    imshow(resized_nearest);
    title('Nearest Neighbor');

    subplot(2, 2, 3);
    imshow(resized_bilinear);
    title('Bilinear');

    subplot(2, 2, 4);
    imshow(resized_bicubic);
    title('Bicubic');

    waitforbuttonpress;
    close(gcf);;
end
% gray_scale_test()
% image_resize()
% get_crop_image()
compare_interpolation_techniques()