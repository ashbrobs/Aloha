function [money, monthly] = qfunc(a, money, monthly)
if a == 1
    disp("q1 test");
    disp("Please use the slider to pick your price range for an apartment.");
    disp("The median price for a 1-bdrm apartment in Evanston is $1,195.");
    p = input("Price: ");
    % replace above with a slider using the game code // Leo
    money = money - p;
    monthly = monthly + p/12;
    disp(money);
elseif a == 2
    disp("q2 test");
    disp("Would you like to take the bus (1), or use a car? (2)")
    d = input("decision: "); %replace with a menu
    if d == 1
        disp("bus taken");
    else
        disp("car taken");
    end
else
    disp("qx test"); % placeholder test and structure of the code, dont use
%     answer = input("Test1 answer: "); 
%     if answer == 1
%         monthly = monthly + 5;
%     else
%         money = money - 10;
%     end
end

end