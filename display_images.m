function display_images(original_img, resized_img)
    % Create a new figure for displaying images
    figure;

    % Display original image
    subplot(1, 2, 1);
    imshow(original_img);
    title('Original Image');
    % 
    % Display resized image
    subplot(1, 2, 2);
    imshow(resized_img);
    title('Resized Image');

    % Wait for user to view the images
    waitforbuttonpress;

    % Close the figure after user interaction
    close(gcf);
end
