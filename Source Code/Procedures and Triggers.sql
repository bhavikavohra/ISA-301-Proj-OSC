--Procedures--

CREATE OR REPLACE PROCEDURE InsertMember(
    AUS_ID IN VARCHAR,
    Name IN VARCHAR,
    Primary_Major IN VARCHAR,
    Standing IN VARCHAR,
    Email IN VARCHAR,
    TEAM IN VARCHAR
)
AS
BEGIN
    INSERT INTO Member (AUS_ID, Name, Primary_Major, Standing, Email, TEAM)
    VALUES (AUS_ID, Name, Primary_Major, Standing, Email, TEAM);
    DBMS_OUTPUT.PUT_LINE('Member ' || Name || ' added.');
END;
/

Select * from member;

EXEC InsertMember ('b00095219', 'Neeraj Vohra', 'Accounting', 'Junior 1', 'b00095219@aus.edu', 'Activities Team');

Select * from member;

CREATE OR REPLACE PROCEDURE INSERT_IDEA_REPOSITORY (
  I_IDEA_NUMBER IN VARCHAR2,
  I_IDEA_NAME IN VARCHAR2,
  I_IDEA_DESCRIPTION IN VARCHAR2,
  I_MEMBER_ID IN VARCHAR2,
  I_IDEA_CATEGORY IN VARCHAR2,
  I_ESTIMATED_BUDGET_REQUIRED IN NUMBER,
  I_STATUS IN VARCHAR2,
  I_SPECIAL_RESOURCES_NEEDED IN VARCHAR2
)
AS
BEGIN
  INSERT INTO Idea_Repository(Idea_Number, Idea_Name, Idea_Description, Member_ID, IdeaCategory, Estimated_Budget_Required, Status, SpecialResoucesNeeded)
  VALUES (I_IDEA_NUMBER, I_IDEA_NAME, I_IDEA_DESCRIPTION, I_MEMBER_ID, I_IDEA_CATEGORY, I_ESTIMATED_BUDGET_REQUIRED, I_STATUS, I_SPECIAL_RESOURCES_NEEDED);
  DBMS_OUTPUT.PUT_LINE('Idea ' || I_IDEA_NAME || ' added successfully');
END;
/


Select * from IDEA_repository;

EXEC INSERT_IDEA_REPOSITORY  ('012', 'EatwithOSC', 'Have lunch with OSC members', 'g00089132', 'EventIdea',200, 'Proposed',NULL);

Select * from IDEA_repository;

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE mark_bill_as_reimbursed(p_bill_no IN VARCHAR2)
AS
BEGIN
  UPDATE Bills
  SET Reimbursed = 'Y'
  WHERE Bill_No = p_bill_no;
  
  DBMS_OUTPUT.PUT_LINE('Bill ' || p_bill_no || ' has been marked as reimbursed.');
END;
/

select *
from bills;

EXEC mark_bill_as_reimbursed('CTF2.0S2319738520');

select *
from bills;

EXEC mark_bill_as_reimbursed('CTF2.0S2319713219');

select *
from bills;

--triggers--

ALTER TABLE Media_Content ADD (Like_View_Ratio NUMBER(10, 2));

CREATE OR REPLACE TRIGGER TRG_CALCULATE_LIKE_VIEW_RATIO
BEFORE INSERT OR UPDATE ON Media_Content
FOR EACH ROW
BEGIN
    IF :NEW.No_Of_Views > 0 THEN
        :NEW.Like_View_Ratio := :NEW.No_Of_Likes / :NEW.No_Of_Views;
    ELSE
        :NEW.Like_View_Ratio := 0;
    END IF;
END;
/

INSERT INTO Media_Content (Content_ID, Creator_AUS_ID, Event_ID, Format, DatePublished, No_Of_Likes, No_Of_Views)
VALUES ('TT-S23-04', 'g00085270', NULL, 'Reel','7-APR-2023', 1000, 5000);

UPDATE Media_Content
SET No_Of_Likes = 150, No_Of_Views = 6000
WHERE Content_ID = 'TTS23-01';


UPDATE Media_Content
SET Like_View_Ratio = CASE
    WHEN No_Of_Views = 0 THEN 0 -- Handle division by zero case
    ELSE No_Of_Likes / No_Of_Views
  END;
















