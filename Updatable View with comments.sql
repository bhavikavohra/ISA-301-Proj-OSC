-- This creates an updatable view called IdeaRepositoryView based on the Idea_Repository table

CREATE VIEW IdeaRepositoryView AS
SELECT *
FROM Idea_Repository
WITH CHECK OPTION; --This ensures that any modifications to the view satisfy the CHECK OPTION constraint


commit; -- This selects all rows from the Idea_Repository table to check if it has been updated

-- This inserts a new row into the IdeaRepositoryView
INSERT INTO IdeaRepositoryView VALUES ('011', 'TechTalks', 'A series of talks about OSS in different fields.', 'g00089132', 'EventIdea', '200', 'Proposed', 'speaker, projector');

--updating the name of the idea, we just added to OSCTechTalks, and increasing the budget from 200 to 300
UPDATE IdeaRepositoryView SET Idea_Name = 'OSCTechTalks', Estimated_Budget_Required = '300' WHERE Idea_Number = '011';

DELETE FROM IdeaRepositoryView WHERE status = 'Unapproved'; --deleting all rows that is 'Unapproved'

select *
from Idea_Repository; -- This selects all rows from the Idea_Repository table to check if it has been updated, according to the insert, update and delete functions we just performed

---------------------------------------------------------------------------------------------------------------------------

CREATE VIEW All_Teams AS
SELECT AUS_ID, Name, Primary_Major, Standing, Email, TEAM, NULL AS Position, NULL AS Tech_skill_Level, NULL AS Media_skill_Level, NULL AS Executive_Team_Position, NULL AS Bank_Account_Number
FROM Member
UNION
SELECT AUS_ID, Name, Primary_Major, Standing, Email, TEAM, Activities_Team_Position AS Position, Tech_skill_Level, NULL AS Media_skill_Level, NULL AS Executive_Team_Position, NULL AS Bank_Account_Number
FROM Activities_Team
UNION
SELECT AUS_ID, Name, Primary_Major, Standing, Email, TEAM, Media_Team_Position AS Position, NULL AS Tech_skill_Level, Media_skill_Level, NULL AS Executive_Team_Position, NULL AS Bank_Account_Number
FROM Media_Team
UNION
SELECT AUS_ID, Name, Primary_Major, Standing, Email, TEAM, Executive_Team_Position AS Position, NULL AS Tech_skill_Level, NULL AS Media_skill_Level, Bank_Account_Number, Executive_Team_Position
FROM Executive_Team;

/*EXPLANATION : This view is a solution to avoid joining multiple member tables together. Essentially, we combine all the member tables i.e., member, activities, media and executive team tables together, by creating a union between all four tables and selecting all attributes from each. It combines the common attributes, creating a large table that contains all the data about all members of the OSC. 
When performing queries using the member table, more often that not, we had to join it with other member tables such as activities team. Hence, this view brings back to the 2NF for ease of computing*/

---------------------------------

CREATE VIEW External_Events AS
SELECT Event.Event_ID, Event.Event_Name, Event.Event_Semester, Event.EventDate, Event.Event_Location, Event.Event_StartTime, 
Event.Event_EndTime, Event.Event_Description, Event.Event_Category, Event.Collaborated_Event, Event.Event_Manager, Event.Attendance, EVENT_COLLABORATED.EMIRATES_ID, COLLABORATORS.NAME_OF_COLLABORATOR, COLLABORATORS.ORGANIZATION, COLLABORATORS.COLLABORATOR_TYPE
FROM (Event JOIN EVENT_COLLABORATED ON EVENT.EVENT_ID = EVENT_COLLABORATED.EVENT_ID)JOIN COLLABORATORS ON EVENT_COLLABORATED.EMIRATES_ID = COLLABORATORS.EMIRATES_ID
WHERE EVENT.COLLABORATED_EVENT = 'Y' AND COLLABORATOR_TYPE = 'External';

/*EXPLANATION : Created a view called "External_Events". A view is like a virtual table that doesn't actually store data, but shows data from other tables based on certain criteria.
The view includes data from three tables: "Event", "EVENT_COLLABORATED", and "COLLABORATORS". It selects specific columns from these tables and filters them based on certain conditions.
The conditions are that the event must be a collaborated event ('Y' in the "Collaborated_Event" column) and the collaborator type must be external ('External' in the "Collaborator_Type" column).
The columns that are included in the view are: event ID, event name, event semester, event date, event location, event start time, event end time, event description, event category, event manager, attendance, collaborator Emirates ID, name of collaborator, organization, and collaborator type.
So basically, the view will show all the events that are collaborated with external organizations and the details of those events along with the external organization and collaborator's information.*/