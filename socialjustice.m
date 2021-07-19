imshow(si) %Choose screen for U.S. or International current events
u = ginput(1);
    %ask for user click
ix = u(1)>250 && u(1)<750;
iy = u(2)>1850 && u(2)<2250;
    %coordinates with a range of error for user clicks
if ix && iy == 1
    text_str = "Learning about what is going on outside of the nation is a great way to look at the big picture! Please select a country on the map (South Africa, Palestine, or China) to focus on.";
    %Prompts user to choose a spot on the map
    imshow(map) %show map
    text(100, 25,text_str,'Color','#D95319','FontSize',12)
    %This is the fundamental way that text is added throughout our program.

    p = ginput(1);
    %ask for user click
    tfo = p(1)>1100 && p(1)<1150;
    tft = p(2)>800 && p(2)<830;
    %coordinates with a range of error for user clicks
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
            
          

                            imshow(sa4)
                            text(340, 10,text_str,'Color','#D95319','FontSize',12)
                            z = waitforbuttonpress;  
%This version loads the image first with the question would you like to donate, then shows links in a seprate figure.
            if z == 0
                fig = uifigure;
                hlink = uihyperlink(fig);
                hlink.Text = 'Subscribe';
                hlink.URL = 'https://action.hrw.org/page/34570/subscribe/1';
                hlink.Position = [100 220 70 22];
%Positions links for different resources.

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
        else 
             close %Our demo currently supports the South Africa selection only
        end
         
else
    close %Our demo currently supports the 'International' option only
end

