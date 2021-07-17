function [money, monthly, mood, monthlymood] = qfunc(a, money, monthly, mood, monthlymood) 
% all variables as inputs and outputs
if a == 1 % if statements call questions
    disp("q1 test");
    disp("Please use the slider to pick your price range for an apartment.");
    disp("The median price for a 1-bdrm apartment in Evanston is $1,195.");
    p = input("Price: ");
    % replace above with a slider using the game code // Leo
    money = money - p;
    monthly = monthly + p;
    mood = mood + p/100;
    % changes variables
    disp(money);
elseif a == 2
    disp("q2 test");
    disp("Would you like to take the bus (1), or use a car? (2)")
    disp("While the car may seem attractive at first, remember that you would have to pay for gas, maintenance, parking, etc.")
    d = input("decision: "); %replace with a menu
    if d == 1
        disp("bus taken");
        monthly = monthly + 105;
        mood = mood - 10;
        monthlymood = monthlymood - 1;
    else
        disp("car taken");
        money = money - 500;
        monthly = monthly + 400;
        mood = mood + 10;
        monthlymood = monthlymood + 1;
    end
else
    disp("qx test"); 
    disp("A month passes without you making any important financial decisions.");
    input("Input anything to proceed.");
% placeholder test and structure of the code, dont use
%     answer = input("Test1 answer: "); 
%     if answer == 1
%         monthly = monthly + 5;
%     else
%         money = money - 10;
%     end
end
end