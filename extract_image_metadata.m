function extract_image_metadata(image_path)
    try
        % Read the image
        info = imfinfo(image_path);
        
        % Extract and display metadata
        fprintf('Image Metadata:\n');
        fprintf('----------------\n');
        fprintf('Filename: %s\n', info.Filename);
        fprintf('File format: %s\n', info.Format);
        fprintf('Image size: %d x %d pixels\n', info.Width, info.Height);
        fprintf('Color space: %s\n', info.ColorType);
        fprintf('Bit depth: %d\n', info.BitDepth);
        fprintf('Creation date: %s\n', info.DateTime);
        
        % Display additional metadata if needed
        % Example: Camera settings, resolution, etc.
        % fprintf('Camera: %s\n', info.CameraModel);
        % fprintf('Resolution: %d DPI\n', info.XResolution);
        
    catch ME
        fprintf('Error: %s\n', ME.message);
    end
end
