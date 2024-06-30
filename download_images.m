function download_images(url)
    % Check if system command wget or curl is available
    if isunix
        if exist('wget', 'file') ~= 2 && exist('curl', 'file') ~= 2
            error('Neither wget nor curl found. Please install either wget or curl to proceed.');
        end
    else
        error('Unsupported operating system. This script currently supports Unix-like systems and Windows.');
    end
    
    % Create temporary directory to save downloaded images
    temp_dir = tempname();
    mkdir(temp_dir);
    
    try
        % Download webpage content
        if isunix
            system(sprintf('wget -q -O %s/temp.html %s', temp_dir, url));
        end
        
        % Read downloaded HTML content
        html_file = fullfile(temp_dir, 'temp.html');
        html_content = fileread(html_file);
        
        % Extract image URLs from HTML content (basic example)
        img_urls = regexp(html_content, '<img\s+[^>]*src="([^"]+)"', 'tokens');
        
        % Download up to 5 images
        download_count = 0;
        for i = 1:numel(img_urls)
            if download_count >= 5
                break;  % Exit loop if already downloaded 5 images
            end
            
            img_url = img_urls{i}{1};
            [~,img_name,img_ext] = fileparts(img_url);
            img_filename = fullfile(temp_dir, [img_name,img_ext]);
            
            if isunix
                system(sprintf('wget -P %s -nd -H -nc -np %s', temp_dir, img_url));
            end
            
            fprintf('Downloaded: %s\n', img_filename);
            download_count = download_count + 1;
        end
        % Display the images using imshow
        for i = 1:min(5, numel(img_urls))  % Display up to 5 images
            img_url = img_urls{i}{1};
            [~,img_name,img_ext] = fileparts(img_url);
            img_filename = fullfile(temp_dir, [img_name,img_ext]);
            
            if exist(img_filename, 'file')
                imshow(img_filename);
                pause(1); % Pause between images (adjust as needed)
            else
                fprintf('Image %s not found.\n', img_filename);
            end
        end
        
    catch ME
        fprintf('Error occurred: %s\n', ME.message);
    end
    
    % Clean up: delete temporary directory and files
    if exist(temp_dir, 'dir')
        rmdir(temp_dir, 's');
    end
end
