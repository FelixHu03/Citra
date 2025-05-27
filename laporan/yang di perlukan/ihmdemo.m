
% File: interactive_histogram_equalization.m
% Author: Felix 2327250059

function interactive_histogram_equalization()
    close all; clc;

    % Load initial image
    img = imread('pout.tif');
    img = im2uint8(img); % Ensure 8-bit grayscale
    figure('Name','Interactive Histogram Equalization','NumberTitle','off','Position',[100 100 1200 600]);

    % UI Elements
    hAx1 = subplot(2,3,1); imshow(img); title('Original Image');
    hAx2 = subplot(2,3,2); imhist(img); title('Original Histogram');

    % Interpolation popup
    uicontrol('Style','text','Position',[950 500 100 20],'String','Interpolation');
    interpMenu = uicontrol('Style','popupmenu','Position',[950 480 120 20], ...
        'String',{'nearest','linear','pchip','spline'}, 'Callback',@updateHist);

    % Continuous update checkbox
    continuousCheckbox = uicontrol('Style','checkbox','Position',[950 450 150 20], ...
        'String','Continuous Update','Value',1);

    % Axes for interactive histogram shaping
    hAx3 = subplot(2,3,3); 
    x = 1:256; y = ones(1,256)*0.5;
    hLine = plot(x, y); title('Desired Histogram Shape');
    ylim([0 1]); xlim([1 256]); grid on;
    set(hLine, 'ButtonDownFcn', @startDragFcn);
    set(hAx3, 'ButtonDownFcn', @addPoint);

    % Processed image and histogram
    hAx4 = subplot(2,3,4); 
    hImEq = imshow(img); title('Equalized Image');
    hAx5 = subplot(2,3,5);
    hHistEq = bar(imhist(img)); title('Equalized Histogram');

    % Button to load new image
    uicontrol('Style','pushbutton','String','Load Image','Position',[950 420 120 25], ...
        'Callback',@loadImage);

    % Interpolation update function
    function updateHist(~,~)
        if get(continuousCheckbox, 'Value')
            applyEqualization();
        end
    end

    % Function to apply histogram shaping
    function applyEqualization()
        ydata = get(hLine, 'YData');
        interpMethod = interpMenu.String{interpMenu.Value};
        desiredShape = interp1(x, ydata, x, interpMethod);
        desiredShape = max(desiredShape, 0); desiredShape = desiredShape / sum(desiredShape); % normalize
        imgEq = histeq(img, desiredShape);
        axes(hAx4); imshow(imgEq); title('Equalized Image');
        axes(hAx5); bar(imhist(imgEq)); title('Equalized Histogram');
    end

    % Mouse interaction: add, move, delete
    function addPoint(~,~)
        cp = get(hAx3, 'CurrentPoint');
        newX = round(cp(1,1));
        newY = cp(1,2);
        if newX >= 1 && newX <= 256
            y(newX) = newY;
            set(hLine, 'YData', y);
            updateHist();
        end
    end

    function startDragFcn(~,~)
        set(gcf, 'WindowButtonMotionFcn', @draggingFcn);
        set(gcf, 'WindowButtonUpFcn', @stopDragFcn);
    end

    function draggingFcn(~,~)
        cp = get(hAx3, 'CurrentPoint');
        newX = round(cp(1,1));
        newY = cp(1,2);
        if newX >= 1 && newX <= 256
            y(newX) = newY;
            set(hLine, 'YData', y);
            updateHist();
        end
    end

    function stopDragFcn(~,~)
        set(gcf, 'WindowButtonMotionFcn', '');
        set(gcf, 'WindowButtonUpFcn', '');
    end

    function loadImage(~,~)
        [file,path] = uigetfile({'*.jpg;*.png;*.tif','Image Files'},'Select an image');
        if isequal(file,0), return; end
        img = imread(fullfile(path,file));
        if size(img,3) > 1
            img = rgb2gray(img);
        end
        img = im2uint8(img);
        axes(hAx1); imshow(img); title('Original Image');
        axes(hAx2); imhist(img); title('Original Histogram');
        applyEqualization();
    end
end
