-- This creates an updatable view called IdeaRepositoryView based on the Idea_Repository table

CREATE VIEW IdeaRepositoryView AS
SELECT *
FROM Idea_Repository
WITH CHECK OPTION; --add a comment here

commit;

-- This inserts a new row into the IdeaRepositoryView
INSERT INTO IdeaRepositoryView VALUES ('011', 'TechTalks', 'A series of talks about OSS in different fields.', 'g00089132', 'EventIdea', '200', 'Proposed', 'speaker, projector');

--updating the name of the idea, we just added to OSCTechTalks, and increasing the budget from 200 to 300
UPDATE IdeaRepositoryView SET Idea_Name = 'OSCTechTalks', Estimated_Budget_Required = '300' WHERE Idea_Number = '011';

DELETE FROM IdeaRepositoryView WHERE status = 'Unapproved'; --deleting all rows that are unapproved
