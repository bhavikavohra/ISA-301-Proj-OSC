-- Update the budget table to calculate the Budget_Left column as the difference between Amount_of_Budget and Budget_Used
UPDATE budget
SET Budget_Left = Amount_of_Budget - Budget_Used;

-- Drop the existing Budget_Left column as it will be replaced by a new derived column
ALTER TABLE budget
DROP COLUMN Budget_Left;

-- Add a new derived column called budget_left that is calculated as the difference between Amount_of_Budget and Budget_Used
ALTER TABLE budget
ADD budget_left AS (amount_of_budget - budget_used);

-- Update the budget table to calculate the Budget_Left column as the difference between Amount_of_Budget and Budget_Used
-- This ensures the Budget_Left value is always up-to-date based on the current budget usage.

-- Drop the existing Budget_Left column as it will be replaced by a new derived column
-- The derived column will automatically calculate the budget left based on the values of Amount_of_Budget and Budget_Used.

-- Add a new derived column called budget_left that is calculated as the difference between Amount_of_Budget and Budget_Used
-- This derived column eliminates the need to manually update the Budget_Left value and ensures data consistency.





