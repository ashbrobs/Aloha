startscreen = imread('Start3-01.png');
map = imread('map.jpg');
sa2 = imread('Sa2.png');
sa3 = imread('Sa3.png');
sa4 = imread('Sa4.png');
bg = imread('BackgroundAlohaGeneral.png');
si = imread('SIntro.png');


%Reads images
imshow(startscreen) %Displays start screen
s = ginput(1); %This is the basic GUI code for our program. The user will click a button depending on the prompt.
tfs = s(1)>1900 && s(1)<2400;
tfr = s(2)>1600 && s(2)<1750;
xl = s(1)>1200 && s(1) < 1600;
yl = s(2)>1500 && s(2) <1800; 
%(1) are x coordinates and (2) are y coordinates. A range of error is
%added for user clicks.
if tfs && tfr == 1 %If user clicks social justice button
socialjustice %Runs social justice program.

elseif xl && yl == 1
    financial_code %Runs financial literacy program

else
    close %closes if user does not choose any
end

