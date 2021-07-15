%% Crop Image and Save Cropped Image
% Read in image
im = imread('NorthwesternLogo.png');

% Display original image
image(im); axis image

% Use ginput to select corner points of a rectangular
% region by pointing and clicking the mouse twice
p = ginput(2); 

% Get the x and y corner coordinates as integers
sp(1) = min(floor(p(1)), floor(p(2))); %xmin
sp(2) = min(floor(p(3)), floor(p(4))); %ymin
sp(3) = max(ceil(p(1)), ceil(p(2)));   %xmax
sp(4) = max(ceil(p(3)), ceil(p(4)));   %ymax

% Index into the original image to create the new image
MM = im(sp(2):sp(4), sp(1): sp(3),:);

% Display the subsetted image with appropriate axis ratio
figure; image(MM); axis image

% Write image to graphics file. 
imwrite(MM,'logo_cropped.tif') 


%% Write Text on Image
x = 10;
y = 100;

text_str = "Northwestern";
imshow(im)
text(x, y,text_str,'Color','white','FontSize',10)