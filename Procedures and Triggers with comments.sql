--Procedures--

--Procedure 1--
--to make the process of inserting a member into the member table easier--

CREATE OR REPLACE PROCEDURE InsertMember( --creating the procedure to help insert members into the member table with AUS_ID, NAME, PRIMARY _MAJOR, STANDING, EMAIL AND TEAM
    AUS_ID IN VARCHAR,
    Name IN VARCHAR,
    Primary_Major IN VARCHAR,
    Standing IN VARCHAR,
    Email IN VARCHAR,
    TEAM IN VARCHAR
)
AS
BEGIN
    INSERT INTO Member (AUS_ID, Name, Primary_Major, Standing, Email, TEAM) --assigning the procedure to insert the values into the member table, once they are inputed
    VALUES (AUS_ID, Name, Primary_Major, Standing, Email, TEAM);
    DBMS_OUTPUT.PUT_LINE('Member ' || Name || ' added.'); --showing ouput in the DBMS OUTPUT as Member 'name' added
END;
/

--trying the procedure

Select * from member; --selecting the member table

EXEC InsertMember ('b00095219', 'Neeraj Vohra', 'Accounting', 'Junior 1', 'b00095219@aus.edu', 'Activities Team'); --adding a new member using the procedure built

Select * from member; --selecting the member table, to check if Neeraj is added 

--Procedure 2--
--to make the process of inserting an idea into the idea_repository table easier--

CREATE OR REPLACE PROCEDURE INSERT_IDEA_REPOSITORY (  --creating the procedure to help insert ideas into the idea_repository table with the following variables
  I_IDEA_NUMBER IN VARCHAR2,
  I_IDEA_NAME IN VARCHAR2,
  I_IDEA_DESCRIPTION IN VARCHAR2, --we have used the alias I to help with the naming convention, but the code would work without it as well
  I_MEMBER_ID IN VARCHAR2,
  I_IDEA_CATEGORY IN VARCHAR2,
  I_ESTIMATED_BUDGET_REQUIRED IN NUMBER,
  I_STATUS IN VARCHAR2,
  I_SPECIAL_RESOURCES_NEEDED IN VARCHAR2
)
AS
BEGIN -- Inserting the values into the Idea_Repository table
  INSERT INTO Idea_Repository(Idea_Number, Idea_Name, Idea_Description, Member_ID, IdeaCategory, Estimated_Budget_Required, Status, SpecialResoucesNeeded)
  VALUES (I_IDEA_NUMBER, I_IDEA_NAME, I_IDEA_DESCRIPTION, I_MEMBER_ID, I_IDEA_CATEGORY, I_ESTIMATED_BUDGET_REQUIRED, I_STATUS, I_SPECIAL_RESOURCES_NEEDED);
  DBMS_OUTPUT.PUT_LINE('Idea ' || I_IDEA_NAME || ' added successfully');
END;
/

--trying the procedure

Select * from IDEA_repository; --selecting the idea_repository table

EXEC INSERT_IDEA_REPOSITORY  ('012', 'EatwithOSC', 'Have lunch with OSC members', 'g00089132', 'EventIdea',200, 'Proposed',NULL);
--inserting a row into the idea_repository table using the procedure

Select * from IDEA_repository; --selecting the idea_repository table, with the newly inserted row

SET SERVEROUTPUT ON; --trying to ensure the DBMS output is shown

--Procedure 3--
--to make the process of updating a bill from not reimbursed to reimbursed easier

CREATE OR REPLACE PROCEDURE mark_bill_as_reimbursed(p_bill_no IN VARCHAR2)  --creating the procedure to help change the reimbursement status of the bill from 'N' to 'Y', when the bills are reimbursed
AS
BEGIN
  UPDATE Bills
  SET Reimbursed = 'Y' --updating and setting the bills reimbursement status to 'Y', for the specific bill number
  WHERE Bill_No = p_bill_no;
  
  DBMS_OUTPUT.PUT_LINE('Bill ' || p_bill_no || ' has been marked as reimbursed.');
END; ---- display a message confirming that the bill has been marked as reimbursed
/

--trying the procedure

select * -- select all rows from the 'Bills' table before any bills are marked as reimbursed
from bills;

EXEC mark_bill_as_reimbursed('CTF2.0S2319738520'); -- mark the bill 'CTF2.0S2319738520' as reimbursed using the procedure

select * -- Select all rows from the 'Bills' table after marking the first bill as reimbursed, and checking if the Reimbursement is changed to 'Y'
from bills;

EXEC mark_bill_as_reimbursed('CTF2.0S2319713219'); -- mark the bill 'CTF2.0S2319713219' as reimbursed using the procedure

select * --selecting the bills table, to see if all bills are now marked 'Y', in reimbursement
from bills;

--Triggers--

--Trigger 1--
--to help calculate a Like View Ratio for each media content row--
--will help OSC to analyse if people who view media content, also like it--

--before creating the trigger, we alter the table to add a column, called Like_View_Ratio
ALTER TABLE Media_Content ADD (Like_View_Ratio NUMBER(10, 2));

CREATE OR REPLACE TRIGGER TRG_CALCULATE_LIKE_VIEW_RATIO --creating a trigger to calculate the like view ratio for media content
BEFORE INSERT OR UPDATE ON Media_Content --trigger will calculate the ratio, for each new row inserted or whenever a row is updated
FOR EACH ROW
BEGIN
    IF :NEW.No_Of_Views > 0 THEN --the ratio will be calculated if the no_of_views is greater than 0
        :NEW.Like_View_Ratio := :NEW.No_Of_Likes / :NEW.No_Of_Views;
    ELSE
        :NEW.Like_View_Ratio := 0; --if no_of_views is not greater than 0, the ratio will be 0
    END IF;
END;
/ --to analyse the ratio, if it is close to 1, that means most people who view media content also like the media content
--if the ratio is closer to 0 than 1, most people just view the post and do not like it

--trying the trigger

INSERT INTO Media_Content (Content_ID, Creator_AUS_ID, Event_ID, Format, DatePublished, No_Of_Likes, No_Of_Views)
VALUES ('TT-S23-04', 'g00085270', NULL, 'Reel','7-APR-2023', 1000, 5000); --inserting values into the media content table
--as seen in the output, the like view ratio is calculated for this new row

UPDATE Media_Content --updating a row in the media_content, to see if the trigger calculates the like view ratio
SET No_Of_Likes = 150, No_Of_Views = 6000
WHERE Content_ID = 'TTS23-01'; --the trigger has calculated the ratio for this row

UPDATE Media_Content
SET Like_View_Ratio = CASE --we are updating the Like_View_Ratio for the previosuly existing rows in the media_content table to maintain consistency
--case is used to help us handle the division by 0
    WHEN No_Of_Views = 0 THEN 0 -- Handle division by zero case
    ELSE No_Of_Likes / No_Of_Views
  END;
  
SELECT *
from media_content; --checking the media content table to see if all rows have like_view_ratio

--Trigger 2--
--this trigger is created to help sort out a new member into a specific team table
--if for example, Kareena is added as a new member into the member table, and she belongs to the Media_Team, this trigger will duplicate her information and insert a new row in the Media Team table

CREATE OR REPLACE TRIGGER TRG_ADD_MEMBER_TO_TEAM --creating a trigger to insert a member into their specific team
AFTER INSERT ON Member --trigger will activate when a new member is inserted into the member table
FOR EACH ROW
BEGIN
  IF :NEW.Team = 'Activities Team' THEN
    INSERT INTO Activities_Team (AUS_ID, Name, Primary_Major, Standing, Email, TEAM, Activities_Team_Position, Tech_skill_Level, Reports_To)
    VALUES (:NEW.AUS_ID, :NEW.Name, :NEW.Primary_Major, :NEW.Standing, :NEW.Email, :NEW.Team, 'Position', 1, 'Reports To'); --if the member is in activities team, they will be added to activities team table
  ELSIF :NEW.Team = 'Media Team' THEN --if the member is in media team, they will be added to media team table
    INSERT INTO Media_Team (AUS_ID, Name, Primary_Major, Standing, Email, TEAM, Media_Team_Position, Media_skill_Level, Reports_To)
    VALUES (:NEW.AUS_ID, :NEW.Name, :NEW.Primary_Major, :NEW.Standing, :NEW.Email, :NEW.Team, 'Position', 1, 'Reports To');
  ELSIF :NEW.Team = 'Executive Team' THEN --if the member is in executive team, they will be added to executive team table
    INSERT INTO Executive_Team (AUS_ID, Name, Primary_Major, Standing, Email, TEAM, Executive_Team_Position, Bank_Account_Number, Reports_To)
    VALUES (:NEW.AUS_ID, :NEW.Name, :NEW.Primary_Major, :NEW.Standing, :NEW.Email, :NEW.Team, 'Position', NULL, NULL);
  END IF;
END;

--trying the trigger 

EXEC InsertMember ('g00089133', 'John Doe', 'Computer Science', 'Junior 2', 'g00089133@aus.edu', 'Activities Team'); --adding a new member using the procedure built earlier

select * 
from Activities_Team; --checking the activities team table to see if John is added

INSERT INTO Member (AUS_ID, Name, Primary_Major, Standing, Email, TEAM)
VALUES ('g00089138', 'Blanket Set', 'Computer Science', 'Junior 2', 'g00089138@aus.edu', 'Media Team'); --inserting a member in using insert values

INSERT INTO Member (AUS_ID, Name, Primary_Major, Standing, Email, TEAM)
VALUES ('g00166666', 'Gorgina Ilk', 'Design Management', 'Junior 1', 'g00166666@aus.edu', 'Executive Team');

select * 
from Media_Team; --checking the media team table to see if John is added

select * 
from Media_Team; --checking the media team table to see if Blanket is added

select * 
from Executive_Team; --checking the executive team table to see if Gorgina is added

--Trigger 3--

-- Trigger to update the status of budget. Budget is rejected if the amount used is greater than the amount allocated by the club. 

CREATE OR REPLACE TRIGGER update_budget_status
AFTER INSERT OR UPDATE OF BUDGET_USED ON Budget
BEGIN  
    UPDATE Budget
    SET Budget_status = 'Rejected'
    WHERE Budget_Used >= Amount_of_Budget ;
END;
/

--trying the trigger--

update Budget
set budget_used = 500
where budget_id = '731984';

select *
from budget;


drop trigger update_budget_status; -- use if needed

---------------------------------------------------------------------------------------------------------------------------
















