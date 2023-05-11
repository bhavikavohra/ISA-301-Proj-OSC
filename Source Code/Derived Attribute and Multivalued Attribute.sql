--making budget left a derived column, derived from Amount_OF_Budget - Budget_Used

update budget
set Budget_Left = Amount_of_Budget - Budget_Used ;

alter table budget
drop column Budget_left; --the existing column made us manually add the budget left, thus we dropped it


ALTER TABLE budget --we then added a new column to replace budget left = that is equal to 
  add budget_left AS (amount_of_budget - budget_used);




