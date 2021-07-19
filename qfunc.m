function [money, monthly, mood, monthlymood, pArray, pmArray] = qfunc(a, money, monthly, mood, monthlymood, pArray, pmArray) 
bg = imread('BackgroundAlohaGeneral.png');
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
    pmArray = [pmArray p];
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
        pmArray = [pmArray 105];
    elseif xc && yc == 1
%         disp("car taken");
        money = money - 1000;
        monthly = monthly + 400;
        mood = mood + 10;
        monthlymood = monthlymood + 1;
        pArray = [pArray 1000];
        pmArray = [pmArray 400];
    else
        close
        disp('fail')
    end
elseif a == 3
%     disp("All your friends are going shopping for clothes! Will you go with them?");
%     q = input(" yes = 1, no = 2" );
    q = questdlg('All your friends are going shopping for clothes! Will you go with them (estimated cost $500)?','Clothing','Yes','No', 'No');
%response converted to yes/no cases
switch q
    case 'Yes'
        p = 500;
        money = money - p;
        mood = mood + 10;
        pArray = [pArray p];
%         disp("Are clothes worth it?");
    case 'No'
         mood = mood - 25;
%        disp("Are clothes worth it?");
end
elseif a == 4
    food = imread('Food.png');
    imshow(food)
%     disp("How much will you be spending on food per month? The average is 320 per month"); %disp as part of image
    i = 0;
    while i == 0
        px = inputdlg("Monthly Food Cost: ");
        p = str2num(px{1});
        if p < 50
                text_str= (["Try not to starve yourself.", "Food is necessary."]);
        imshow(bg)
        
        text(50, 400,text_str,'Color','#D95319','FontSize',25);
%             disp("Try not to starve yourself. Food is necessary.")
        else
            i = 1;
        end
    end
    monthly = monthly + p;
    pmArray = [pmArray p];
elseif a == 5
    laptop = imread('Laptop.png');
    imshow(laptop)
    fq = questdlg('Buy the laptop?', 'Laptop', 'Yes','No', 'No');
    switch fq
    case 'Yes'
        p = 3000;
        money = money - 3000;
        mood = mood + 10;
        pArray = [pArray p];
%         disp("Are clothes worth it?");
    case 'No'

    end
%     disp("NEW LAPTOP ON SALE! 3000 DOLLARS!!!");
    % yes or no
    % if yes, money down 3k and mood up
        % money = money - 3000;
        % mood = mood + 10
    % if no then nothing so dont run this case
else
    pro = imread('pro.png');
    imshow(pro)
%     disp("qx test"); 
%     disp("A month passes without you making any important financial decisions.");
%     input("Input anything to proceed.");
    waitforbuttonpress

% placeholder test and structure of the code, dont use
%     answer = input("Test1 answer: "); 
%     if answer == 1
%         monthly = monthly + 5;
%     else
%         money = money - 10;
%     end
end
end