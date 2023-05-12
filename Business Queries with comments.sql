-------------------------------------------------------------------------------------------------------

----BHAVIKA QUERIES---

--QUERY 1---

---Query to help find the next president, an activities team member who has 1) managed more than 2 events 2) has the highest average attendance at the events managed by them

-- Selects the event manager, name, average attendance, and number of events managed
SELECT E.EVENT_MANAGER, A.NAME, AVG(E.ATTENDANCE) AS AVG_ATTENDANCE, count(e.event_id) as events_managed
FROM EVENT E JOIN ACTIVITIES_TEAM A ON E.EVENT_MANAGER=A.AUS_ID ---- Joins the EVENT and ACTIVITIES_TEAM tables on the AUS_ID column, where the EVENT_MANAGER column in the EVENT table is the same as the AUS_ID in the ACTIVITIES_TEAM table
GROUP BY E.EVENT_MANAGER, A.NAME ---- Groups the results by the EVENT_MANAGER and NAME columns 
HAVING COUNT(E.EVENT_ID)>2 --Filters the results to only include those with more than 2 events managed
ORDER BY AVG_ATTENDANCE DESC; --Order the results in descending order of average attendance

--using a subquery to perform the same as above--subquery final
SELECT atm.AUS_ID, atm.Name, count(e.event_id) as events_managed, avg(e.attendance) as avg_attendance
FROM ACTIVITIES_Team atm --Giving alias to atm to activities_team and e to event
FULL OUTER JOIN Event e ON e.Event_Manager = atm.AUS_ID --Performing a FULL OUTER JOIN between ACTIVITIES_Team and Event tables
WHERE atm.AUS_ID IN ( --Subquery to select those event_manager from event, who have managed more than 2 events
    SELECT event_manager
    FROM Event
    GROUP BY event_manager --Grouping the results by event_manager
    HAVING COUNT(*) > 2
)
GROUP BY atm.AUS_ID, atm.Name -- Grouping the results by the event manager's AUS_ID and Name
ORDER BY avg(e.attendance) DESC; ----- Ordering the results in descending order based on the average attendance

---QUERY 2----

-----Query to help find the next head_of_media, an media team member who has 1) created more than 3 media content 2) has the highest average likes on the media content made by them

-- Selecting the creator's AUS_ID, name, average likes, and count of content created
SELECT C.CREATOR_AUS_ID, M.NAME, AVG(C.NO_OF_LIKES) AS AVG_LIKES, count(c.content_id) as content_created
---Giving alias c to media_content and m to media_team
FROM MEDIA_CONTENT C JOIN MEDIA_TEAM M ON C.CREATOR_AUS_ID=M.AUS_ID -- Joining the MEDIA_CONTENT table with the MEDIA_TEAM table using the creator's AUS_ID
GROUP BY C.CREATOR_AUS_ID, M.NAME -- Grouping the results by the creator's AUS_ID and media team name
HAVING COUNT(C.CONTENT_ID)>3 -- Filtering the results to include only those creators who have created more than 3 content items
ORDER BY AVG_LIKES DESC; ---- Ordering the results by average likes in descending order

---QUERY 3----

--Query to see which collaborator has collaborated in more than 1 event

SELECT collaborators.Emirates_id, Collaborators.Name_of_Collaborator,cOLLABORATORS.ORGANIZATION, collaborators.collaborator_type, COUNT(Event_Collaborated.Event_ID) as Num_of_Events_Collaborated_On FROM Collaborators -- Selecting the collaborators' Emirates ID, name, organization, collaborator type, and the count of events collaborated on from the collaborators table
INNER JOIN Event_Collaborated ON Collaborators.Emirates_ID = Event_Collaborated.Emirates_ID -- Performing an Innner Join between the Collaborators table with the Event_Collaborated table using the Emirates ID
GROUP BY collaborators.Emirates_id, Collaborators.Name_of_Collaborator, COLLABORATORS.ORGANIZATION, collaborators.collaborator_type -- Grouping the results by the collaborators' Emirates ID, name, organization, and collaborator type
HAVING COUNT(Event_Collaborated.Event_ID) > 1; -- Filtering the results to include only those collaborators who have collaborated on more than 1 event

--Query to see which events they have collaborated with OSC on

SELECT ce.Event_ID, ce.Event_Name, ce. attendance -- Selecting the Event ID, Event Name, and attendance from the Collaborated_Events table (which has an alias of ce)
FROM Collaborated_Events ce 
INNER JOIN Event_Collaborated ec ON ce.Event_ID = ec.Event_ID  --Performing inner join between Collaborated_Events table ce and the Event_Collaborated table ec using the Event ID
WHERE ec.Emirates_ID = '784-2001-5675567-1'; -- Filtering the results to include only the events where the Emirates ID matches '784-2001-5675567-1'

----QUERY 4----

--Query to see which events have spent more than the allocated budget

SELECT event.event_id, event.event_name, budget.AMOUNT_OF_BUDGET AS ALLOCATED_BUDGET, BUDGET.BUDGET_USED AS SPENT_AMOUNT, BUDGET.BUDGET_LEFT AS REMAINING_FUNDS
FROM event --Selecting the eventid, event name, allocated budget, budget used and budget left from the event table
JOIN budget ON event.event_id = budget.event_id -- Joining the event table with the budget table using the Event ID
WHERE BUDGET_USED>AMOUNT_OF_BUDGET -- Filtering the results to include only the events where the Budget Used is greater than the Allocated Budget
ORDER BY SPENT_AMOUNT DESC; -- Ordering the results by Spent Amount in descending order

---QUERY 5-----

--Query to see how much budget was spent according to the semesters, in a descending order

Select Academic_Term, SUM(BUDGET.AMOUNT_OF_BUDGET) AS ALLOCATED_AMOUNT, sum(budget_used) as total_spent
from budget --From the budget table
group by academic_term --Group by the academic term
ORDER BY total_spent DESC;--Orders the result in descending order based on the 'total_spent' column.

---QUERY 6---

--Query to see the newly created IdeaRepository table

Select * --selecting all the rows from the IdeaRepository table
From Idea_Repository;

---QUERY 7---

--Query to check how many members are left to reimburse and by how much

Select m.Name, b.Purchased_BY as AUS_ID, sum(b.amount_of_bill) as money_owed, B.HANDLED_BY AS PAYER, E.NAME AS PAYER_NAME
from Member m --Alias to member table (m) and bills table (b) and executive team (e)
-- Performing a RIGHT JOIN between the Member table and Bills table on the AUS_ID of the Member and the Purchased_BY column of Bills
-- Joining the Executive Team table on the Payer AUS_ID (HANDLED_BY) from Bills and the AUS_ID from Executive Team
RIGHT JOIN Bills b ON m.AUS_ID = b.Purchased_BY JOIN EXECUTIVE_TEAM E ON b.HANDLED_BY=E.AUS_ID
where Reimbursed = 'N' -- Filtering the results to include only the bills that have not been reimbursed (Reimbursed = 'N')
Group By m.name, b.Purchased_BY, B.HANDLED_BY, E.NAME ; --Grouping the member name, purchased by AUS_ID, Payer AUD_ID, and Payer Name

----QUERY 8----

--Query to see if fall semesters or spring semesters have higher average participation/attendance 

-- Selecting the semester of the event based on the Event_Semester column from Event table and assigning it a simplified label (Fall or Spring)
--If the Semester starts from Fall, it will be grouped as Fall
--If the Semester starts from Spring, it will be grouped as Spring

SELECT 
  CASE --We use case to help group the data in the Event_Semester column, according to Fall and Spring
    WHEN Event_Semester LIKE 'Fall%' THEN 'Fall' ----the first 4 letters should be Fall, and the rest can be anything, thus we use %
    WHEN Event_Semester LIKE 'Spring%' THEN 'Spring'
  END AS Event_Semester,
  AVG(Attendance) AS Avg_Attendance   -- Calculating the average attendance for each semester
FROM Event --From event semester
WHERE Event_Semester LIKE 'Fall%' OR Event_Semester LIKE 'Spring%' ---- Filtering the events based on their semester (Fall or Spring)
GROUP BY -- Grouping the results by Fall or Spring
  CASE
    WHEN Event_Semester LIKE 'Fall%' THEN 'Fall' --If the semester begins with Fall, it will be grouped as Fall, regardless of any letters after the l
    WHEN Event_Semester LIKE 'Spring%' THEN 'Spring'
  END
ORDER BY AVG(Attendance) DESC; -- Ordering the results based on the average attendance in descending order

-------- The '%' symbol is a wildcard character used in the LIKE operator, that helps us group semesters based on the first 4 letters they begin with
----- 'Fall' or 'Spring' followed by any additional characters, will be grouped together as we used the % function

---QUERY 9---

----Query to check if media posts with higher views or higher likes, lead to higher attendance
---Essentially, we want to check the correlation between No. of Likes of a media content and the attendance at an event
---Essentially, we want to check the correlation between No. of Views of a media content and the attendance at an event
--We can see if a person is more likely to attend an event, if they just view a media content or view and like the media content

SELECT ---Using the corr function to calculate the correlation between the likes on the media content and attendance at the event/ views on the media content and attendance at the event
  CORR(mc.No_Of_Likes, e.Attendance) as Correlation_Likes_Att, CORR(mc.No_Of_Views, e.Attendance) as Correlation_Views_Att
FROM 
  Media_Content mc --Giving an alias mc to Media_Content table and e to Event table
  INNER JOIN Event e ON mc.Event_ID = e.Event_ID -- Performing an Inner Join the Media_Content and Event tables based on the Event_ID
WHERE 
e.Attendance IS NOT NULL; -- Filters out events with NULL attendance values, as we don't want events with attendance of NULL to impact the correlation

-------------------------------------------------------------------------------------------------------

----MHD. DAR QUERIES---

--QUERY 10---
select *
from MEMBER
where name like 'Ra%';

--QUERY 11--
select AUS_ID, Name, Primary_Major, Standing, Email, Team, Activities_Team_Position, Tech_Skill_Level, Reports_To
from Activities_Team
where primary_major = 'Computer Science' and Standing = 'Junior 2';

-------------------------------------------------------------------------------------------------------

----COLIN QUERIES--

--QUERY 12 ---

SELECT E.EVENT_NAME, E.EVENT_ID, E.ATTENDANCE, EC.EMIRATES_ID, C.ORGANIZATION 
FROM EVENT E 
JOIN EVENT_COLLABORATED EC ON E.EVENT_ID = EC.EVENT_ID 
JOIN COLLABORATORS C ON EC.EMIRATES_ID = C.EMIRATES_ID
ORDER BY C.ORGANIZATION, EC.EVENT_ID;  

--QUERY 13 ---

SELECT MT.AUS_ID, M.NAME, COUNT(*) AS NUM_OF_CONTENT
FROM MEMBER M 
JOIN MEDIA_TEAM MT ON M.AUS_ID = MT.AUS_ID
JOIN MEDIA_CONTENT MC ON MT.AUS_ID = MC.CREATOR_AUS_ID
GROUP BY MT.AUS_ID, M.NAME
ORDER BY NUM_OF_CONTENT DESC
FETCH FIRST 1 ROW ONLY;

-------------------------------------------------------------------------------------------------------

----NABEEL QUERIES---

--QUERY 14 ---

SELECT e.Event_Semester, e.Event_Name, e.Attendance
FROM Event e
WHERE e.Attendance = (SELECT MIN(Attendance) FROM Event WHERE Event_Semester = e.Event_Semester)
ORDER BY e.Event_Semester, e.Event_Name;

--QUERY 15 ---

SELECT e.Event_ID, e.Event_Name, SUM(b.Amount_Of_Budget) AS Total_Budget
FROM Event e LEFT JOIN Budget b ON e.Event_ID = b.Event_ID
WHERE b.Amount_Of_Budget IS NOT NULL
GROUP BY e.Event_ID, e.Event_Name
ORDER BY Total_Budget DESC
FETCH FIRST 5 ROWS ONLY;

-------------------------------------------------------------------------------------------------------

----RAFID QUERIES---

--QUERY 16 ---

SELECT Content_ID, Event_ID, No_of_likes from Media_Content
ORDER BY No_of_likes DESC
FETCH FIRST 5 ROWS ONLY;

--QUERY 17 ---

SELECT Bill_No, Amount_of_Bill, Purchased_By, Merchant_Name, Payment_Method, Reimbursed, Payment_Date, Budget_No, Handled_By
FROM Bills
WHERE Reimbursed = 'N';

-------------------------------------------------------------------------------------------------------




