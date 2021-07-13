%greet user and explain situation, needs code
money = input("input budget: ");
monthly = 0; % placeholder
mood = 0; % happiness placeholder
%above are all the variables needed for the code


questions = [q1 q2]; %variables array for questions

questions = questions(randperm(length(questions)));

for x = 1:length(questions)
    if money > 0
        money = money - monthly;
        disp(questions(x));
        % calculate effects using a database of the questions and what they
        % do;; these are placeholders
    else
        takeLoan = 0; % testing when user does not take loan
        if takeLoan == 1
            input("Please take out a loan: ")
            monthly = monthly + loan/12;
        else
            disp("you fail") %this ends all loops
            break
        end
    end
end

function question1 = q1(~)
    question1 = input("Test1: "); %what I want to do here is,
    %if q1 is called, I want certain conditions to occur
    %monthly = monthly + 5; this does not work because monthly is not in
    %function
end

function question2 = q2(~)
    question2 = input("Test2: "); 
end
