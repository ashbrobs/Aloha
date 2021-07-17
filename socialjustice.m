startscreen = imread('Start3-01.png');
map = imread('map.jpg');
sa2 = imread('Sa2.png');
sa3 = imread('Sa3.png');
sa4 = imread('Sa4.png');

imshow(startscreen)
s = ginput(1);
tfs = s(1)>1900 && s(1)<2400;
tfr = s(2)>1600 && s(2)<1750;
xl = s(1)>1200 && s(1) < 1600;
yl = s(2)>1500 && s(2) <1800; 
if tfs && tfr == 1
%load graphics
text_str = "Learning about what is going on outside of the nation is a great way to look at the big picture! Please select a country on the map (South Africa, Palestine, or China) to focus on.";
%Prompts user to choose a spot on the map
imshow(map) %show map
text(100, 25,text_str,'Color','#D95319','FontSize',12)

p = ginput(1);
%ask for user click
tfo = p(1)>1100 && p(1)<1150;
tft = p(2)>800 && p(2)<830;
%cooridantes with a ~10 cell range of error for user clicks
if tfo && tft == 1
    %The x and y coordinates for the click must both be within the range of
    %error
    text_str = "Click anywhere to proceed";
    imshow(sa2)
    text(340, 7,text_str,'Color','#D95319','FontSize',12)
    %Show the information for South Africa
    t = waitforbuttonpress;
 %User clicks to move to next slide



    if t == 0
        imshow(sa3)
        text(360, 7,text_str,'Color','#D95319','FontSize',12)
       
        h = waitforbuttonpress;
        %User clicks to move to next slide
        if h == 0
            
           



% f=uifigure;
% ax=uiaxes(f);
% imagedata= sa4;
% image(imagedata,  "Parent", ax);
% ax.Visible='off';

% hlink = uihyperlink(f);
% hlink.Text = 'Subscribe';
% hlink.URL = 'https://action.hrw.org/page/34570/subscribe/1';
% hlink.Position = [40 60 70 22];
% 
% hlink2 = uihyperlink(f);
% hlink2.Text = 'Donate';
% hlink2.URL = 'https://donate.hrw.org/page/65440/donate/1?ea.tracking.id=EP2021EVpg';
% hlink.Position = [60 60 70 22];
% 
% hlink = uihyperlink(f);
% hlink.Text = 'Petition';
% hlink.URL = 'https://www.thepetitionsite.com/243/366/680/south-africa-stop-discrimination-against-children-with-disabilities/';
% hlink.Position = [20 60 70 22];

%or

imshow(sa4)
text(340, 10,text_str,'Color','#D95319','FontSize',12)
z = waitforbuttonpress;  %This version loads the image first with the question would you like to donate, then shows links in a seprate figure.
if z == 0
fig = uifigure
hlink = uihyperlink(fig);
hlink.Text = 'Subscribe';
hlink.URL = 'https://action.hrw.org/page/34570/subscribe/1';
hlink.Position = [100 220 70 22];


hlink2 = uihyperlink(fig);
hlink2.Text = 'Donate';
hlink2.URL = 'https://donate.hrw.org/page/65440/donate/1?ea.tracking.id=EP2021EVpg';



hlink3 = uihyperlink(fig);
hlink3.Text = 'Petition';
hlink3.URL = 'https://www.thepetitionsite.com/243/366/680/south-africa-stop-discrimination-against-children-with-disabilities/';
hlink3.Position = [100 160 70 22];

hlink4 = uihyperlink(fig);
hlink4.Text = 'Read More';
hlink4.URL = 'https://www.hrw.org/news/2019/05/24/south-africa-children-disabilities-shortchanged';
hlink4.Position = [100 280 70 22];

end
        end
    end
end
elseif xl && yl == 1
    disp('done')
else close
end
