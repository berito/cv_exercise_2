function import_display_images(directory)
    files = dir(fullfile(directory, '*.JPG'));
    for i = 1:length(files)
        try
            img = imread(fullfile(directory, files(i).name));
            figure;
            colormap gray;
            subplot(1, 3, 1);
            imagesc(img);
            title(sprintf('Original - %s', files(i).name));
            subplot(1, 3, 2);
            imagesc(img);
            colormap hot;
            title('Hot Colormap');

            subplot(1, 3, 3);
            imagesc(img);
            colormap jet;
            title('Jet Colormap');
            % Add a title to the figure
            annotation('textbox', [0.5, 0.95, 0, 0], 'String', sprintf('Image: %s', files(i).name), ...
                'HorizontalAlignment', 'center', 'FontSize', 14, 'EdgeColor', 'none');
            % Adjust figure properties
            set(gcf, 'Position', [100, 100, 1200, 400]);  % Adjust figure size
            user_input = questdlg('Do you want to view the next image?', ...
                                  'Continue', ...
                                  'Yes', 'No', 'Yes');
            if strcmp(user_input, 'No')
                fprintf('Exiting...\n');
                close all; 
                break;
            end
            close all; 

        catch ME
            fprintf('Error reading %s: %s\n', files(i).name, ME.message);
        end
    end
end
