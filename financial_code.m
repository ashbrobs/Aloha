%greet user and explain situation, needs code
money = inputdlg("Input Budget for 12 months: "); %Allows user to input budget without leaving figure
money = str2num(money{1}); %converts string to numerical values
monthly = 0; % placeholder
mood = 50; % happiness placeholder
monthlymood = 0; %monthlymood change placeholder
loan = 0; % loan placeholder
loanCount = 0; % loancount placeholder
fail = 0; % fail condition
pArray = []; % array of prices spent over game
%above are all the variables needed for the code


questions = 1:12; % variables array for questions, second number is number of q

questions = questions(randperm(length(questions))); % randomizes questions

for x = 1:length(questions) % iterates through code number of questions times
    % loans take up a question slot with this loop, so you lose that question
    % perhaps can be fixed with a while loop, however is unnecessary at the
    % moment
    a = questions(x); % sets var a equal to the value in array questions
    if money > 0 
        money = money - monthly; % monthly change in money
        mood = mood + monthlymood + money/10000 - monthly/1000; % monthly change in mood
         text_str= (["Total Money:",money, "Monthly Costs:", monthly, "Mood:", mood, "Click to Proceed"]);
        imshow(bg)
        text(50, 400,text_str,'Color','#D95319','FontSize',25);
        waitforbuttonpress
        [money, monthly, mood, monthlymood, pArray] = qfunc(a, money, monthly, mood, monthlymood, pArray);
        
        % calls output of the qfunc function
     
       
 %Same as social justice section, text is added to a blank background. This
 %screen will show the user money, costs, and mood.
        
    else
        %         tl = ginput(1);
%         xtl = tl(1)>%xmin && tl(1)<%xmax; %X coordinates of yes button
% tfytl = tl(2)>%ymin && tl(2)<%ymax; %Y coordinates of yes button
%         asktakeLoan = inputdlg("Take a loan? (1 = yes, 2 = no): "); % take loan input
%           takeLoan = str2num(asktakeLoan{1});
asktakeloan = questdlg('Take a loan?','Loan','Yes','No', 'No');
          switch asktakeloan
    case 'Yes'
         if loanCount < 2
                askloanamount = inputdlg("Please take out a loan: "); % take loan input
          loan = str2num(askloanamount{1});
%             loan = input("Please take out a loan: "); 
                money = money + loan; % you get the loan
                monthly = monthly + loan/12; % but you lose money per month
                loanCount = loanCount + 1;
            else
%                 disp("Sorry, but your outstanding loans mean you are financially dead now.");
%                 disp("You failed at a debt amount of"); % this ends all loops
%                 disp(abs(money));
                  text_str= (["Sorry, but your outstanding loans", "mean you are financially dead now.", "You failed at a debt amount of",abs(money), "Click to Proceed"]);
        imshow(bg)
        text(50, 600,text_str,'Color','#D95319','FontSize',20);
 waitforbuttonpress
                fail = 1;
                break
                
                %Intial outcome 1/2 leads to 'lose' (too many loans)
         end
    case 'No'
             text_str= (["You failed at a debt amount of",abs(money), "Click to Proceed"]);
        imshow(bg)
        text(50, 600,text_str,'Color','#D95319','FontSize',20);
            fail = 1;
            waitforbuttonpress
            break
             %Intial outcome 2/2 leads to 'lose' (too much debt)
          end
%     
   end

end

if fail == 0
%     disp("You somehow made it through without losing all of your money!");
%     disp("Here is your final money count.");
%     disp(money);
    text_str= (["You somehow made it through without losing all of", "your money! Here is your final money count.",money, "Click to Proceed"]);
        imshow(bg)
        text(50, 600,text_str,'Color','#D95319','FontSize',20);
    waitforbuttonpress
%Final outcome (win) 1/2   
    
else
%     disp("You may need to watch your finances more carefully...");
    text_str= (["You may need to watch your finances more carefully","Click to Proceed"]);
        imshow(bg)
        text(50, 600,text_str,'Color','#D95319','FontSize',18);
waitforbuttonpress   
end

%Final outcome (lose) 2/2 

sortedx = insertion_sortIBL(pArray); % need a new slide for this with explanation
text_str= (["Here are your sorted expenses, track them", "monthly so that you know what", "your spending correlates to:", sortedx]);

imshow(bg)
text(50, 600,text_str,'Color','#D95319','FontSize',18);
 
yn = questdlg('Would you like to read advice about budgeting?', 'Budgeting', 'Yes', 'No', 'No'); %Question dialog asking the user if they would like advice about budgeting
switch yn
    case 'Yes' %If yes
advice=imread('BudgetingAdvice.png'); 
imshow(advice) %Shows budgeting advice
    case 'No'
     close %closes program
end
 
% display all the costs you incurred using the sorting algorithm as well
% advice here, maybe after each individual question too is possible