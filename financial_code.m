FStart = imread('FStart.png');
imshow(FStart) %Financial literacy start screen
waitforbuttonpress %Wait for user to click before proceeding. This is used multiple times in our code.
money = inputdlg("Input Budget for 12 months. Integers only, no commas: "); %Allows user to input budget without leaving figure
money = str2num(money{1}); %converts string to numerical values
monthly = 0; % placeholder
mood = 50; % happiness placeholder
monthlymood = 0; %monthlymood change placeholder
loan = 0; % loan placeholder
loanCount = 0; % loancount placeholder
fail = 0; % fail condition
pArray = []; % array of prices spent over game
pmArray = [];
loanArray = [];
%above are all the variables needed for the code


questions = 1:12; % variables array for questions, second number is number of q

questions = questions(randperm(length(questions))); % randomizes questions

for x = 1:length(questions) % iterates through code number of questions times
    % loans take up a question slot with this loop, so you lose that question
    a = questions(x); % sets var a equal to the value in array questions
    if money > 0 
        text_str= (["Total Money:",money, "Monthly Costs:", monthly, "Mood:", mood, "Click to Proceed"]);
        imshow(bg) %Blank background with Aloha logo.
        money = money - monthly; % monthly change in money
        mood = mood + monthlymood + money/10000 - monthly/1000; % monthly change in mood
        text(50, 400,text_str,'Color','#D95319','FontSize',25); %Shows text and variables on top of background
        waitforbuttonpress
        [money, monthly, mood, monthlymood, pArray, pmArray] = qfunc(a, money, monthly, mood, monthlymood, pArray, pmArray);
        
        % calls output of the qfunc function. Refer to qfunc.m for
        % comments.
     
       
 %Same as social justice section, text is added to a blank background. This
 %screen will show the user money, costs, and mood.
        
    else

asktakeloan = questdlg('You have run out of money. Take a loan?','Loan','Yes','No', 'No'); %Question pop-up.
          switch asktakeloan
    case 'Yes'
         if loanCount < 2
                askloanamount = inputdlg("Please take out a loan: "); % take loan input
          loan = str2num(askloanamount{1});
%             loan = input("Please take out a loan: "); 
                money = money + loan; % you get the loan
                monthly = monthly + loan/12; % but you lose money per month
                loanArray = [loanArray loan];
                loanCount = loanCount + 1;
            else
%                 disp("Sorry, but your outstanding loans mean you are financially dead now.");
%                 disp("You failed at a debt amount of"); % this ends all loops
%                 disp(abs(money));
                  text_str= (["Sorry, but your outstanding loans", "mean you are financially dead now.", "Click to Proceed"]);
        imshow(bg)
        text(50, 600,text_str,'Color','#D95319','FontSize',20);
 waitforbuttonpress
                fail = 1;
                break
                
                %Intial outcome 1/2 leads to 'lose' (too many loans)
         end
    case 'No'
             
        
            fail = 1;
            
            break
             %Intial outcome 2/2 leads to 'lose' (too much debt)
          end
%     
   end

end
if money < 0 %See line 86
    fail = 1;
end
if fail == 0
    text_str= (["You somehow made it through", "without losing all of your money!", "Here is your final money count.",money, "Click to Proceed"]);
        imshow(bg)
        text(50, 600,text_str,'Color','#D95319','FontSize',20);
    waitforbuttonpress
%Final outcome (win) 1/2   
    
else %If money <0
    text_str= (["You failed at a debt amount of",abs(money), " ", "You may need to watch your finances more carefully", "Click to Proceed"]);
    imshow(bg)
        text(50, 600,text_str,'Color','#D95319','FontSize',20);
    waitforbuttonpress   
end

%Final outcome (lose) 2/2. This outcome occurs if there are too many loans,
%an amount in debt, or the user ran out of money and did not take a loan.

sortedx = flip(insertion_sortIBL(pArray)); %Insertion sort. Sorts the one-time expenses from highest to lowest.
text_str= (["Here are your sorted one-time", "expenses from highest to lowest.", "Track them monthly so", "that you know what your spending correlates to:", sortedx]);
imshow(bg)
text(50, 600,text_str,'Color','#D95319','FontSize',18); %Loads sorted variables on blank background.
waitforbuttonpress
sortedy = flip(insertion_sortIBL(pmArray)); %Insertion sort. Sorts monthly expenses from highest to lowest.
text_str= (["Here are your sorted monthly", "expenses, track them monthly so that", "you know what your", "spending correlates to:", sortedy]);
imshow(bg)
text(50, 600,text_str,'Color','#D95319','FontSize',18); %Loads sorted monthly variables on blank background.
waitforbuttonpress
sortedz = flip(insertion_sortIBL(loanArray)); 
text_str= (["Here are your loans", "that you currently hold:", sortedz]);
imshow(bg)
text(50, 600,text_str,'Color','#D95319','FontSize',18);
waitforbuttonpress
% add loans amounts

yn = questdlg('Would you like to read advice about budgeting?', 'Budgeting', 'Yes', 'No', 'No'); %Question dialog asking the user if they would like advice about budgeting
switch yn
    case 'Yes' %If yes
advice=imread('BudgetingAdvice.png'); 
imshow(advice) %Shows budgeting advice
    case 'No'
     close %closes program
end
 