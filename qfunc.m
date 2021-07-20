function [money, monthly, mood, monthlymood, pArray, pmArray] = qfunc(a, money, monthly, mood, monthlymood, pArray, pmArray) 
%Comments that start with display show what the program does without
%graphical interface.
bg = imread('BackgroundAlohaGeneral.png');
% all variables as inputs and outputs
if a == 1 % if statements call questions

%    Prompts the user to input their price for an apartment.
%     Display "The median price for a 1-bdrm apartment in Evanston is $1,195."
    px = inputdlg("Please input your price for an apartment. The median price for a 1-bedroom apartment in Evanston is $1,195.");
    p = str2num(px{1}); %Converts the input in string form to number form so that it can be affected by the questions.
  
    money = money - p; %Subtracts apartment price from money every month
    monthly = monthly + p; %Keeps track of monthly expenses
    mood = mood + p/100; 
    pmArray = [pmArray p];
% Changes variables
%Display "money"
%Display "monthly money"
%Display "mood." There is also a hidden variable called monthly mood that
%changes the mood on a monthly basis.
elseif a == 2
    car = imread('car.png');
    imshow(car)
    c = ginput(1);
    xb = c(1)>460 && c(1)<540; %Bus button X min and max.
    yb = c(2)>1480 && c(2)<1620; %Bus button Y min and max.
    xc = c(1)>400 && c(1) < 680; %Car button X min and max.
    yc = c(2)>1950 && c(2) <2120; %Car button Y min and max.

%Prompts user to choose between bus and car

    if xb && yb == 1
        
%Bus taken
        monthly = monthly + 105;
        mood = mood - 10;
        monthlymood = monthlymood - 1;
        pmArray = [pmArray 105];
    elseif xc && yc == 1
%Car taken
        money = money - 1000;
        monthly = monthly + 400;
        mood = mood + 10;
        monthlymood = monthlymood + 1;
        pArray = [pArray 1000];
        pmArray = [pmArray 400];
    else
        close

    end
elseif a == 3
%    Question (multiple choice box): "All your friends are going shopping for clothes! Will you go with them?"

    q = questdlg('All your friends are going shopping for clothes! Will you go with them (estimated cost $500)?','Clothing','Yes','No', 'No');
%response converted to yes/no cases
switch q
    case 'Yes'
        p = 500;
        money = money - p;
        mood = mood + 10;
        pArray = [pArray p];

    case 'No'
         mood = mood - 25;

end
elseif a == 4
    food = imread('Food.png');
    imshow(food)
%    Displays as part of image, "How much will you be spending on food per month? The average is 320 per month"
    i = 0;
    while i == 0
        px = inputdlg("Monthly Food Cost: ");
        p = str2num(px{1}); %Converts monthly food cost from string form to numerical form.
        if p < 50 %If the user inputs a food cost less than 50
                text_str= (["Try not to starve yourself.", "Food is necessary."]);
        imshow(bg)
        
        text(50, 400,text_str,'Color','#D95319','FontSize',25);
%The input prompt appears again, so that this time the user can type an
%amount higher than 50.
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

    case 'No'

    end

    % yes or no
    % if yes, money down 3k and mood up
        % money = money - 3000;
        % mood = mood + 10
    % if no then nothing so don't run this case
else
    pro = imread('pro.png');
    imshow(pro)
%This question will appear whenever one of the other 5 are not randomly
%chosen. It is used to move time along, while still subtracting all monthly
%costs and affecting mood depending on the user's previous decisions. The
%user clicks anywhere to proceed to the next questions.
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