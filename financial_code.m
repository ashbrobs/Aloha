%greet user and explain situation, needs code
money = input("input budget: ");
monthly = 0; % placeholder
mood = 0; % happiness placeholder
%above are all the variables needed for the code


questions = [1 2]; %variables array for questions

questions = questions(randperm(length(questions)));

for x = 1:length(questions)
    a = questions(x);
    if money > 0
        money = money - monthly;
        disp(questions(x));
        % calculate effects using a database of the questions and what they
        % do;; these are placeholders
        [money, monthly] = qfunc(a, money, monthly);
        disp("total money:");
        disp(money);
        disp("monthly costs:");
        disp(monthly);
    else
        takeLoan = 0; % testing when user does not take loan
        if takeLoan == 1
            input("Please take out a loan: ")
            monthly = monthly + loan/12;
        else
            disp("you failed at a debt value of"); %this ends all loops
            disp(money);
            break
        end
    end
end

disp("You somehow made it through without losing all of your money!");
disp("Here is your final money count.");
disp(money);