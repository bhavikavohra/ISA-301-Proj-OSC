-------------------------------------------------------------------------------------------------------

----BHAVIKA QUERIES---

--FINAL QUERY 
SELECT E.EVENT_MANAGER, A.NAME, AVG(E.ATTENDANCE) AS AVG_ATTENDANCE, count(e.event_id) as events_managed
FROM EVENT E JOIN ACTIVITIES_TEAM A ON E.EVENT_MANAGER=A.AUS_ID
GROUP BY E.EVENT_MANAGER, A.NAME
HAVING COUNT(E.EVENT_ID)>2
ORDER BY AVG_ATTENDANCE DESC;

--FINAL QUERY
SELECT C.CREATOR_AUS_ID, M.NAME, AVG(C.NO_OF_LIKES) AS AVG_LIKES, count(c.content_id) as content_created
FROM MEDIA_CONTENT C JOIN MEDIA_TEAM M ON C.CREATOR_AUS_ID=M.AUS_ID
GROUP BY C.CREATOR_AUS_ID, M.NAME
HAVING COUNT(C.CONTENT_ID)>3
ORDER BY AVG_LIKES DESC;

--using a subquery to perform the same as above--subquery final
SELECT atm.AUS_ID, atm.Name, count(e.event_id) as events_managed, avg(e.attendance) as avg_attendance
FROM ACTIVITIES_Team atm
FULL OUTER JOIN Event e ON e.Event_Manager = atm.AUS_ID
WHERE atm.AUS_ID IN (
    SELECT event_manager
    FROM Event
    GROUP BY event_manager
    HAVING COUNT(*) > 2
)
GROUP BY atm.AUS_ID, atm.Name
ORDER BY avg(e.attendance) DESC;

--to see which collaborator has collaborated in more than 1 event--FINAL QUERY
SELECT collaborators.Emirates_id, Collaborators.Name_of_Collaborator,cOLLABORATORS.ORGANIZATION, collaborators.collaborator_type, COUNT(Event_Collaborated.Event_ID) as Num_of_Events_Collaborated_On FROM Collaborators
INNER JOIN Event_Collaborated ON Collaborators.Emirates_ID = Event_Collaborated.Emirates_ID
GROUP BY collaborators.Emirates_id, Collaborators.Name_of_Collaborator, COLLABORATORS.ORGANIZATION, collaborators.collaborator_type
HAVING COUNT(Event_Collaborated.Event_ID) > 1;

SELECT ce.Event_ID, ce.Event_Name, ce. attendance --final query
FROM Collaborated_Events ce 
INNER JOIN Event_Collaborated ec ON ce.Event_ID = ec.Event_ID 
WHERE ec.Emirates_ID = '784-2001-5675567-1';



--to see the collaborators in the events --FINAL QUERY
SELECT e.event_id, e.event_name, c.name_of_collaborator, c.organization
FROM Collaborated_Events e
LEFT OUTER JOIN event_collaborated ec ON e.event_id = ec.event_id
LEFT OUTER JOIN collaborators c ON ec.emirates_id = c.emirates_id;

--to see how much budget was spent on different events in a descending order --FINAL QUERY
SELECT event.event_id, event.event_name, budget.budget_used AS total_spent
FROM event
JOIN budget ON event.event_id = budget.event_id
ORDER BY total_spent DESC;

--TO SEE WHICH EVENTS SPENT MORE THAN ALLOCATED BUDGET --FINAL QUERY
SELECT event.event_id, event.event_name, budget.AMOUNT_OF_BUDGET AS ALLOCATED_BUDGET, BUDGET.BUDGET_USED AS SPENT_AMOUNT, BUDGET.BUDGET_LEFT AS REMAINING_FUNDS
FROM event
JOIN budget ON event.event_id = budget.event_id
WHERE BUDGET_USED>AMOUNT_OF_BUDGET
ORDER BY SPENT_AMOUNT DESC;


--to see how much budget was spent according to the semesters, in a descending order
--FINAL QUERY
Select Academic_Term, SUM(BUDGET.AMOUNT_OF_BUDGET) AS ALLOCATED_AMOUNT, sum(budget_used) as total_spent
from budget
group by academic_term
ORDER BY total_spent DESC;

--to see the newly created idearepository table
Select *
From Idea_Repository;

--checking how many members are left to reimburse and by how much --FINAL QUERY
Select m.Name, b.Purchased_BY as AUS_ID, sum(b.amount_of_bill) as money_owed, B.HANDLED_BY AS PAYER, E.NAME AS PAYER_NAME
from Member m
RIGHT JOIN Bills b ON m.AUS_ID = b.Purchased_BY JOIN EXECUTIVE_TEAM E ON b.HANDLED_BY=E.AUS_ID
where Reimbursed = 'N'
Group By m.name, b.Purchased_BY, B.HANDLED_BY, E.NAME ;


--to see if fall semesters or spring semesters have higher participation rate--FINAL QUERY

SELECT 
  CASE
    WHEN Event_Semester LIKE 'Fall%' THEN 'Fall'
    WHEN Event_Semester LIKE 'Spring%' THEN 'Spring'
  END AS Event_Semester,
  AVG(Attendance) AS Avg_Attendance
FROM Event
WHERE Event_Semester LIKE 'Fall%' OR Event_Semester LIKE 'Spring%'
GROUP BY 
  CASE
    WHEN Event_Semester LIKE 'Fall%' THEN 'Fall'
    WHEN Event_Semester LIKE 'Spring%' THEN 'Spring'
  END
ORDER BY AVG(Attendance) DESC;


--to check if media posts with high views, lead to higher participation--FINAL
SELECT 
  CORR(mc.No_Of_Likes, e.Attendance) as Correlation_Likes_Att, CORR(mc.No_Of_Views, e.Attendance) as Correlation_Views_Att
FROM 
  Media_Content mc
  INNER JOIN Event e ON mc.Event_ID = e.Event_ID
WHERE 
e.Attendance IS NOT NULL;

SELECT --NOT REALLY--
  e.Event_ID, 
  e.Event_Name, 
  mc.No_Of_Views, 
  e.Attendance
FROM 
  Event e
  INNER JOIN Media_Content mc ON e.Event_ID = mc.Event_ID
ORDER BY 
  mc.No_Of_Views DESC;

-------------------------------------------------------------------------------------------------------

----MHD. DAR QUERIES---

--QUERY 1---
select *
from MEMBER
where name like 'Ra%';

--QUERY 2--
select AUS_ID, Name, Primary_Major, Standing, Email, Team, Activities_Team_Position, Tech_Skill_Level, Reports_To
from Activities_Team
where primary_major = 'Computer Science' and Standing = 'Junior 2';

-------------------------------------------------------------------------------------------------------

----NABEEL QUERIES---

SELECT e.Event_Semester, e.Event_Name, e.Attendance
FROM Event e
WHERE e.Attendance = (SELECT MIN(Attendance) FROM Event WHERE Event_Semester = e.Event_Semester)
ORDER BY e.Event_Semester, e.Event_Name;

SELECT e.Event_ID, e.Event_Name, SUM(b.Amount_Of_Budget) AS Total_Budget
FROM Event e LEFT JOIN Budget b ON e.Event_ID = b.Event_ID
WHERE b.Amount_Of_Budget IS NOT NULL
GROUP BY e.Event_ID, e.Event_Name
ORDER BY Total_Budget DESC
FETCH FIRST 5 ROWS ONLY;

-------------------------------------------------------------------------------------------------------






