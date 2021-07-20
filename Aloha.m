startscreen = imread('Start3-01.png');
map = imread('map.jpg');
sa2 = imread('Sa2.png');
sa3 = imread('Sa3.png');
sa4 = imread('Sa4.png');
bg = imread('BackgroundAlohaGeneral.png');
si = imread('SIntro.png');
%Reads images necessary for starting the game and the Social Justice section

imshow(startscreen) %Displays start screen
s = ginput(1); %This is the basic GUI code for our program. The user will click a button depending on the prompt.
tfs = s(1)>1900 && s(1)<2400; %Social justice button X min and max.
tfr = s(2)>1600 && s(2)<1750; %Social justice button Y min and max.
xl = s(1)>1200 && s(1) < 1600; %Financial literacy button X min and max.
yl = s(2)>1500 && s(2) <1800; %Financial literacy button Y min and max.
%(1) are x coordinates and (2) are y coordinates. A range of error is
%added for user clicks.
if tfs && tfr == 1 %If user clicks social justice button
socialjustice %Runs social justice program. Refer to socialjustice.m for comments.
%Only the social justice topic for South Africa is coded. Clicking 'U.S' in the first prompt or
%any of the other countries in the map will close the game.

elseif xl && yl == 1
    financial_code %Runs financial literacy program. Refer to financial_code.m for comments.

else
    close %Closes figure if user does not choose any
end

