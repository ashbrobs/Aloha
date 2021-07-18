function [money, monthly, mood, monthlymood] = qfunc(a, money, monthly, mood, monthlymood) 
% all variables as inputs and outputs
if a == 1 % if statements call questions
%     disp("q1 test");
%     disp("Please use the slider to pick your price range for an apartment.");
%     disp("The median price for a 1-bdrm apartment in Evanston is $1,195.");
px = inputdlg("Please input your price for an apartment. The median price for a 1-bedroom apartment in Evanston is $1,195.");
    p = str2num(px{1});
    % replace above with a slider using the game code // Leo
    money = money - p;
    monthly = monthly + p;
    mood = mood + p/100;
    % changes variables
%     disp(money);
elseif a == 2
    car = imread('car.png');
    imshow(car)
c = ginput(1);
xb = c(1)>460 && c(1)<540;
yb = c(2)>1480 && c(2)<1620;
xc = c(1)>480 && c(1) < 580;
yc = c(2)>1950 && c(2) <2120; 

%     disp("q2 test");
%     disp("Would you like to take the bus (1), or use a car? (2)")
%     disp("While the car may seem attractive at first, remember that you would have to pay for gas, maintenance, parking, etc.")
%     d = input("decision: "); %replace with a menu
    if xb && yb == 1
        
%         disp("bus taken");
        monthly = monthly + 105;
        mood = mood - 10;
        monthlymood = monthlymood - 1;
    elseif xc && yc == 1
%         disp("car taken");
        money = money - 500;
        monthly = monthly + 400;
        mood = mood + 10;
        monthlymood = monthlymood + 1;
    else
        close
        disp('fail')
    end
else
    pro = imread('pro.png');
    imshow(pro)
%     disp("qx test"); 
%     disp("A month passes without you making any important financial decisions.");
%     input("Input anything to proceed.");
    waitforbuttonpress
%       text_str= (["Total Money:",money, "Monthly Costs:", monthly, "Mood:", mood, "Monthly Change in Mood:",monthlymood]);
%         bgx = imread('BackgroundAlohaGeneral.png');
%       imshow(bgx)
%         text(50, 400,text_str,'Color','#D95319','FontSize',25);
% placeholder test and structure of the code, dont use
%     answer = input("Test1 answer: "); 
%     if answer == 1
%         monthly = monthly + 5;
%     else
%         money = money - 10;
%     end
end
end