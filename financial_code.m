%greet user and explain situation, needs code
money = input("input budget: ");
monthly = 0; % placeholder
mood = 50; % happiness placeholder
monthlymood = 0;
loan = 0; % loan placeholder
%above are all the variables needed for the code


questions = 1:2; % variables array for questions, second number is number of q

questions = questions(randperm(length(questions))); % randomizes questions

for x = 1:length(questions) % iterates through code number of questions times
    % loans take up a question slot with this loop, so you lose that question
    % perhaps can be fixed with a while loop, however is unnecessary at the
    % moment
    a = questions(x); % sets var a equal to the value in array questions
    if money > 0 
        money = money - monthly; % monthly change in money
        mood = mood + monthlymood + money/1000 - monthly/1000; % monthly change in mood
        [money, monthly, mood, monthlymood] = qfunc(a, money, monthly, mood, monthlymood);
        % calls output of the qfunc function
        disp("total money:");
        disp(money);
        disp("monthly costs:");
        disp(monthly);
        disp("mood:");
        disp(mood);
        disp("monthly change in mood:"); % hide in final code as secret
        disp(monthlymood);
        % above is simply display placeholders for the values
    else
        takeLoan = input("Take a loan? (1 2): "); % take loan input
        if takeLoan == 1 % if take loan
            loan = input("Please take out a loan: "); 
            money = money + loan; % you get the loan
            monthly = monthly + loan/12; % but you lose money per month
        else
            disp("you failed at a debt value of"); % this ends all loops
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