map = imread('map.jpg');
sa2 = imread('Sa2.png');
sa3 = imread('Sa3.png');
sa4 = imread('Sa4.png');
imshow(map)
p = ginput(1);
tfo = p(1)>1100 && p(1)<1150;
tft = p(2)>800 && p(2)<830;
if tfo && tft == 1
    imshow(sa2)
    t = waitforbuttonpress;
 



    if t == 0
        imshow(sa3)
        h = waitforbuttonpress;
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
z = waitforbuttonpress;
if z == 0
fig = uifigure
hlink = uihyperlink(fig);
hlink.Text = 'Subscribe';
hlink.URL = 'https://action.hrw.org/page/34570/subscribe/1';
hlink.Position = [200 200 70 22];


hlink2 = uihyperlink(fig);
hlink2.Text = 'Donate';
hlink2.URL = 'https://donate.hrw.org/page/65440/donate/1?ea.tracking.id=EP2021EVpg';



hlink3 = uihyperlink(fig);
hlink.Text = 'Petition';
hlink.URL = 'https://www.thepetitionsite.com/243/366/680/south-africa-stop-discrimination-against-children-with-disabilities/';
hlink.Position = [100 160 70 22];

end
        end
    end
end
