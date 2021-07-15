%greet user and explain situation, needs code
money = input("input budget: ");
monthly = 0; % placeholder
mood = 50; % happiness placeholder
monthlymood = 0;
loan = 0; % loan placeholder
%above are all the variables needed for the code


questions = [1 2]; %variables array for questions

questions = questions(randperm(length(questions)));

for x = 1:length(questions) 
    % loans take up a question slot with this loop, so you lose that question
    % perhaps can be fixed with a while loop, however is unnecessary at the
    % moment
    a = questions(x);
    if money > 0
        money = money - monthly;
        mood = mood + monthlymood;
        mood = mood - monthly/1000;
        disp(questions(x));
        % calculate effects using a database of the questions and what they
        % do;; these are placeholders
        [money, monthly, mood, monthlymood] = qfunc(a, money, monthly, mood, monthlymood);
        disp("total money:");
        disp(money);
        disp("monthly costs:");
        disp(monthly);
        disp("mood:");
        disp(mood);
        disp("monthly change in mood:"); % hide in final code
        disp(monthlymood);
    else
        takeLoan = input("Take a loan? (1 2): ");
        if takeLoan == 1
            loan = input("Please take out a loan: ");
            money = money + loan;
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
% display all the costs you incurred using the sorting algorithm as well
% advice here, maybe after each individual question too is possible