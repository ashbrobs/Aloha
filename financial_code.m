%greet user and explain situation, needs code
money = inputdlg("Input Budget: "); %Allows user to input budget without leaving figure
money = str2num(money{1}); %converts string to numerical values
monthly = 0; % placeholder
mood = 50; % happiness placeholder
monthlymood = 0; %monthlymood change placeholder
loan = 0; % loan placeholder
loanCount = 0; % loancount placeholder
fail = 0; % fail condition
%above are all the variables needed for the code


questions = 1:10; % variables array for questions, second number is number of q

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
        text_str= (["Total Money:",money, "Monthly Costs:", monthly, "Mood:", mood, "Monthly Change in Mood:",monthlymood]);
        imshow(bg)
        text(50, 400,text_str,'Color','#D95319','FontSize',25);
 
        
    else
        %         tl = ginput(1);
%         xtl = tl(1)>%xmin && tl(1)<%xmax; %X coordinates of yes button
% tfytl = tl(2)>%ymin && tl(2)<%ymax; %Y coordinates of yes button
        takeLoan = input("Take a loan? (1 2): "); % take loan input
        if takeLoan == 1 % if take loan
            if loanCount < 2
                loan = input("Please take out a loan: "); 
                money = money + loan; % you get the loan
                monthly = monthly + loan/12; % but you lose money per month
                loanCount = loanCount + 1;
            else
                disp("Sorry, but your outstanding loans mean you are financially dead now.");
                disp("You failed at a debt amount of"); % this ends all loops
                disp(abs(money));
                fail = 1;
                break
            end
        else
            disp("You failed at a debt amount of"); % this ends all loops
            disp(abs(money));
            fail = 1;
            break
        end
    end
end

if fail == 0
    disp("You somehow made it through without losing all of your money!");
    disp("Here is your final money count.");
    disp(money);
else
    disp("You may need to watch your finances more carefully...");
end

% display all the costs you incurred using the sorting algorithm as well
% advice here, maybe after each individual question too is possible