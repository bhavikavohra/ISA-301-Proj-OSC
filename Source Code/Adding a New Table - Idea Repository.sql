Create table Idea_Repository(
 Idea_Number VARCHAR(9) Primary Key,
 Idea_Name VARCHAR(50) NOT NULL,
 Idea_Description VARCHAR(100) NOT NULL,
 Member_ID VARCHAR(9) NOT NULL,
 IdeaCategory VARCHAR(15) NOT NULL,
 Estimated_Budget_Required NUMBER(6,2),
 Status VARCHAR(30) NOT NULL CHECK (Status='Completed' or Status='To be Executed' or Status= 'Unapproved' or Status = 'Proposed'),
 SpecialResoucesNeeded VARCHAR (50)
 );
 
 Alter table Idea_Repository
Add Foreign Key (Member_ID) References Member (AUS_ID);

insert into Idea_Repository
values('001', 'OSCMovieNight2.0', 'A movie night with OSC to watch the movie Snowden ', 'b00084833', 'EventIdea', '100', 'Proposed', 'projector' );

INSERT INTO Idea_Repository VALUES ('002', 'GuesstheOSSoftware', 'A Instagram Story Series with OS software hints and polls to guess the OSS.', 'g00087337', 'MediaIdea', '50', 'Proposed', null);
INSERT INTO Idea_Repository VALUES ('003', 'MeetTheTeam', 'Day in the Life Instagram story series with different members once a week.', 'g00087337', 'MediaIdea', '0', 'Proposed', null);
INSERT INTO Idea_Repository VALUES ('004', 'TechnoBytes', 'Instagram Story series with OSS related news. ', 'g00090589', 'MediaIdea', '0', 'Proposed', null);
INSERT INTO Idea_Repository VALUES ('005', 'OSCDataScienceSeries', 'An event series about data science in different fields such as business, engineering, architecture.', 'g00089132', 'EventIdea', null, 'To be Executed', null);
INSERT INTO Idea_Repository VALUES ('006', 'WhoWantsToBeAMillionare?', 'An event wherein we play the game Who Wants to Be A Millionaire with questions about OSS.', 'b00090070', 'EventIdea', null, 'To be Executed', null);
INSERT INTO Idea_Repository VALUES ('007', 'Taboo2.0', 'A part 2 for the Taboo event.', 'b00088385', 'EventIdea', '200', 'Proposed', 'customized OSC Taboo cards');
INSERT INTO Idea_Repository VALUES ('008', 'Aren''tWeOSome?', 'A Who''s Most Likely to Instagram Story Series with OSC members.', 'g00089132', 'MediaIdea', '0', 'To be Executed', 'OSC Member pictures');
INSERT INTO Idea_Repository VALUES ('009', 'BoardGameNightwithOSC', 'A board game night with OSC, playing games like chess, UNO and so on.', 'g00089132', 'EventIdea', '300', 'Proposed', 'board games');
INSERT INTO Idea_Repository VALUES ('010', '7Days7OSS', 'An Instagram Story Series where we educate members about OSS, one a day for a week.', 'g00085775', 'MediaIdea', '0', 'Unapproved', null);

