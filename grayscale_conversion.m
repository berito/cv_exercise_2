% ======  grayscale_conversion==========
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




