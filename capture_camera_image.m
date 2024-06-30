function capture_camera_image()
    try
        % Check if the required package is installed
        pkg load image-acquisition;
        
        % Create a video input object for Linux using v4l2
        vid = videoinput('linuxvideo', 1);  % Adjust device ID as needed (1 is commonly used)
        
        % Set up video device properties
        set(vid, 'FramesPerTrigger', 1);  % Capture single frame
        set(vid, 'TriggerRepeat', Inf);   % Continuous capturing
        set(vid, 'ReturnedColorSpace', 'rgb');  % Set color space
        
        % Start video device
        start(vid);
        
        % Create a figure window for adjusting parameters
        fig = figure('Name', 'Camera Preview');
        
        % GUI controls for brightness and contrast
        brightness_slider = uicontrol('Style', 'slider', 'Min', -255, 'Max', 255, 'Value', 0, ...
                                      'Position', [20, 20, 200, 20], 'Callback', @adjust_brightness);
        brightness_label = uicontrol('Style', 'text', 'String', 'Brightness', ...
                                     'Position', [20, 50, 80, 20]);
        
        contrast_slider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 2, 'Value', 1, ...
                                    'Position', [20, 80, 200, 20], 'Callback', @adjust_contrast);
        contrast_label = uicontrol('Style', 'text', 'String', 'Contrast', ...
                                   'Position', [20, 110, 80, 20]);
        
        % Capture button
        capture_button = uicontrol('Style', 'pushbutton', 'String', 'Capture Image', ...
                                   'Position', [20, 140, 100, 30], 'Callback', @capture_image);
        
        % Callback functions for slider adjustments
        function adjust_brightness(~, ~)
            brightness_value = round(get(brightness_slider, 'Value'));
            set(vid, 'Brightness', brightness_value);
        end
        
        function adjust_contrast(~, ~)
            contrast_value = get(contrast_slider, 'Value');
            set(vid, 'Contrast', contrast_value);
        end
        
        % Callback function for capturing image
        function capture_image(~, ~)
            % Trigger and get a single frame
            trigger(vid);
            img = getdata(vid);
            
            % Display captured image
            figure;
            imshow(img);
            title('Captured Image');
        end
        
        % Wait for user to close the figure
        waitfor(fig);
        
        % Clean up: stop and delete video object
        stop(vid);
        delete(vid);
        clear vid;
        
    catch ME
        fprintf('Error occurred: %s\n', ME.message);
    end
end
