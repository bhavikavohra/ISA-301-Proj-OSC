--members table
insert into member
values('b00084833', 'Prem Rajendran', 'Computer Science', 'Senior 2', 'b00084833@aus.edu', 'Executive Team');

insert into member
values('b00088138', 'Ahmed Sharafath', 'Computer Engineering', 'Junior 2', 'b00088138@aus.edu', 'Executive Team');

insert into member
values('g00085775', 'Chavi Mehta', 'Finance', 'Senior 2', 'g00085775@aus.edu', 'Executive Team');

insert into member
values('g00087337', 'Snikita Moka', 'Architecture', 'Junior 2', 'g00087337@aus.edu', 'Executive Team');

insert into member
values('b00090070', 'Rishi Chugh', 'Management Information Systems', 'Junior 2', 'b00090070@aus.edu', 'Activities Team');

insert into member
values('g00089132', 'Bhavika Vohra', 'Accounting', 'Junior 2', 'g00089132@aus.edu', 'Activities Team');

insert into member
values('b00088385', 'Utkarsh Chauhan', 'Mechanical Engineering', 'Junior 2', 'b00088385@aus.edu', 'Activities Team');

insert into member
values('b00087818', 'Abdu Sallouh', 'Computer Science', 'Junior 2', 'b00087818@aus.edu', 'Activities Team');

insert into member
values('b00092301', 'Taufiq Syed', 'Computer Science', 'Sophmore 2', 'b00092301@aus.edu', 'Activities Team');

insert into member
values('b00087520', 'Koushal Parupudi', 'Computer Science', 'Junior 2', 'b00087520@aus.edu', 'Activities Team');

insert into member
values('b00089432', 'Minhaz Basith', 'Mathematics', 'Junior 2', 'b00089432@aus.edu', 'Activities Team');

insert into member
values('b00087698', 'Muhammad Ahmer', 'Computer Science', 'Junior 2', 'b00087698@aus.edu', 'Activities Team');

insert into member
values('b00089801', 'Aadhith Shankarnarayanan', 'Computer Science', 'Junior 2', 'b00089801@aus.edu', 'Activities Team');

insert into member
values('b00093718', 'Chirag Khanchandani', 'Finance', 'Sophmore 2', 'b00093718@aus.edu', 'Activities Team');

insert into member
values('g00090589', 'Zunaira Farooq', 'Computer Engineering', 'Sophmore 2', 'g00090589@aus.edu', 'Media Team');

insert into member
values('b00093124', 'Mohamed Raiyan', 'Computer Science', 'Sophmore 2', 'b00093124@aus.edu', 'Media Team');

insert into member
values('g00085270', 'Hannan Arshad', 'Visual Communication', 'Junior 2', 'g00085270@aus.edu', 'Media Team');

insert into member
values('g00088567', 'Rhea Maria Jacob', 'Electrical Engineering', 'Junior 2', 'g00088567@aus.edu', 'Media Team');

insert into member
values('b00086276', 'Ajay Sunil', 'Architecture', 'Junior 2', 'b00086276@aus.edu', 'Media Team');

insert into member
values('g00088575', 'Ramziyya Abdul Rahman', 'Electrical Engineering', 'Junior 2', 'g00088575@aus.edu', 'Media Team');

insert into member
values('b00091171', 'Adithya Krishnakumar', 'Computer Science', 'Sophmore 2', 'b00091171@aus.edu', 'Media Team');

insert into member
values('g00094956', 'Raagini Vohra', 'Accounting', 'Freshman 1', 'g00094956@aus.edu', 'Media Team');

insert into member
values('b00094999', 'Madhav Vohra', 'Accounting', 'Freshman 1', 'b00094999@aus.edu', 'Media Team');

insert into member
values('g00087588', 'Pritika Tilokani', 'Marketing', 'Junior 2', 'g00087588@aus.edu', 'Media Team');

insert into member
values('b00088589', 'Arpit Jain', 'Finance', 'Junior 2', 'b00088589@aus.edu', 'Media Team');

--Executive Team
insert into executive_team
values('b00084833', 'Prem Rajendran', 'Computer Science', 'Senior 2', 'b00084833@aus.edu', 'Executive Team', 'President', 'AE867280963400758960283', NULL);

insert into executive_team
values('b00088138', 'Ahmed Sharafath', 'Computer Engineering', 'Junior 2', 'b00088138@aus.edu', 'Executive Team', 'Vice-President', NULL, 'President');

insert into executive_team
values('g00085775', 'Chavi Mehta', 'Finance', 'Senior 2', 'g00085775@aus.edu', 'Executive Team', 'Treasurer', 'AE636789189562026613410', 'President');

insert into executive_team
values('g00087337', 'Snikita Moka', 'Architecture', 'Junior 2', 'g00087337@aus.edu', 'Executive Team', 'Executive Assistant', NULL, 'President');

--Activites Team
insert into activities_team
values('b00090070', 'Rishi Chugh', 'Management Information Systems', 'Junior 2', 'b00090070@aus.edu', 'Activities Team', 'Head Of Activities', 7, 'President');

insert into activities_team
values('g00089132', 'Bhavika Vohra', 'Accounting', 'Junior 2', 'g00089132@aus.edu', 'Activities Team', 'Public Relations Coordinator', 5, 'President');

insert into activities_team
values('b00088385', 'Utkarsh Chauhan', 'Mechanical Engineering', 'Junior 2', 'b00088385@aus.edu', 'Activities Team', 'Research Coordinator', 6, 'President');

insert into activities_team
values('b00087818', 'Abdu Sallouh', 'Computer Science', 'Junior 2', 'b00087818@aus.edu', 'Activities Team', 'Activities Officer', 2, 'Head Of Activities');

insert into activities_team
values('b00092301', 'Taufiq Syed', 'Computer Science', 'Sophmore 2', 'b00092301@aus.edu', 'Activities Team', 'Activities Officer', 10, 'Head Of Activities');

insert into activities_team
values('b00087520', 'Koushal Parupudi', 'Computer Science', 'Junior 2', 'b00087520@aus.edu', 'Activities Team', 'Activities Officer', 8, 'Head Of Activities');

insert into activities_team
values('b00089432', 'Minhaz Basith', 'Mathematics', 'Junior 2', 'b00089432@aus.edu', 'Activities Team', 'Activities Officer', 5, 'Head Of Activities');

insert into activities_team
values('b00087698', 'Muhammad Ahmer', 'Computer Science', 'Junior 2', 'b00087698@aus.edu', 'Activities Team', 'Activities Officer', 9, 'Head Of Activities');

insert into activities_team
values('b00089801', 'Aadhith Shankarnarayanan', 'Computer Science', 'Junior 2', 'b00089801@aus.edu', 'Activities Team', 'Activities Officer', 10, 'Head Of Activities');

insert into activities_team
values('b00093718', 'Chirag Khanchandani', 'Finance', 'Sophmore 2', 'b00093718@aus.edu', 'Activities Team', 'Activities Officer', 3, 'Head Of Activities');

--Media Team
insert into media_team
values('g00090589', 'Zunaira Farooq', 'Computer Engineering', 'Sophmore 2', 'g00090589@aus.edu', 'Media Team', 'Head of Media', 10, 'President');

insert into media_team
values('b00093124', 'Mohamed Raiyan', 'Computer Science', 'Sophmore 2', 'b00093124@aus.edu', 'Media Team', 'Media Coordinator', 7, 'Head of Media');

insert into media_team
values('g00085270', 'Hannan Arshad', 'Visual Communication', 'Junior 2', 'g00085270@aus.edu', 'Media Team', 'Media Coordinator', 8, 'Head of Media');

insert into media_team
values('g00088567', 'Rhea Maria Jacob', 'Electrical Engineering', 'Junior 2', 'g00088567@aus.edu', 'Media Team', 'Media Coordinator', 7, 'Head of Media');

insert into media_team
values('b00086276', 'Ajay Sunil', 'Architecture', 'Junior 2', 'b00086276@aus.edu', 'Media Team', 'Media Coordinator', 10, 'Head of Media');

insert into media_team
values('g00088575', 'Ramziyya Abdul Rahman', 'Electrical Engineering', 'Junior 2', 'g00088575@aus.edu', 'Media Team', 'Media Coordinator', 6, 'Head of Media');

insert into media_team
values('b00091171', 'Adithya Krishnakumar', 'Computer Science', 'Sophmore 2', 'b00091171@aus.edu', 'Media Team', 'Media Coordinator', 7, 'Head of Media');

insert into media_team
values('g00094956', 'Raagini Vohra', 'Accounting', 'Freshman 1', 'g00094956@aus.edu', 'Media Team', 'Media Coordinator', 9, 'Head of Media');

insert into media_team
values('b00094999', 'Madhav Vohra', 'Accounting', 'Freshman 1', 'b00094999@aus.edu', 'Media Team', 'Media Coordinator', 6, 'Head of Media');

insert into media_team
values('g00087588', 'Pritika Tilokani', 'Marketing', 'Junior 2', 'g00087588@aus.edu', 'Media Team', 'Media Coordinator', 7, 'Head of Media');

insert into media_team
values('b00088589', 'Arpit Jain', 'Finance', 'Junior 2', 'b00088589@aus.edu', 'Media Team', 'Media Coordinator', 2, 'Head of Media');

--Events
insert into event
values('CFF20', 'OSC Club Fair Fall 2020', 'Fall 2020', '22-SEP-2020', 'Zoom', '2:00 PM', '3:00 PM', 'Quiz Show and Indoor Scavenger Hunt.', 'Recreational', 'N', 'b00090070', 95);

insert into event
values('PALOALTF20', 'Info Session with Palo Alto', 'Fall 2020', '28-SEP-2020', 'Zoom', '6:00 PM', '7:00 PM', 'Info Session - Palo Alto for career opportunities', 'Informational', 'Y', 'g00089132', 102);

insert into event
values('NNF20', 'Introduction to Neural Networks', 'Fall 2020', '07-OCT-2020', 'Zoom', '7:00 PM', '8:00 PM', 'Introduction to Neural Networks for Beginners.', 'Informational', 'Y', 'b00087520', 77);

insert into event
values('MNF20', 'Movie Night with OSC', 'Fall 2020', '14-OCT-2020', 'Zoom+Netflix Party', '5:00 PM', '6:00 PM', 'Movie Night with OSC - The Matrix :)', 'Recreational', 'N', 'b00087520', 30);

insert into event
values('AMNGUSF20', 'Data Analysis Reported', 'Fall 2020', NULL, NULL, NULL, NULL, 'Analyze the data to help us find the imposter.', 'Competition', 'N', 'b00092301', NULL);

insert into event
values('AWSF20', 'Introduction to Amazon Web Services', 'Fall 2020', '30-NOV-2020', 'Zoom', '6:00 PM', '7:00 PM', 'Learn about AWS + free courses offered by them', 'Informational', 'Y', 'b00087520', 110);

insert into event
values('ONLSECS21', 'How Secure are you Online?', 'Spring 2021', '08-MAR-2021', 'Blackboard Collab', '6:00 PM', '7:00 PM', 'Find out how to improve your digital security!', 'Informational', 'N', 'b00090070', 55);

insert into event
values('IOTS21', 'Introduction to Internet of Things', 'Spring 2021', '08-MAR-2021', 'Blackboard Collab', '5:00 PM', '6:00 PM', 'Learn about the use of IoT in the Real World!', 'Educational', 'Y', 'b00087818', 46);

insert into event
values('ONWOSCS21', 'Open Night with Open Source', 'Spring 2021', '05-MAY-2021', 'Zoom', '8:30 PM', '9:30 PM', 'Party with OSC-say goodbye to the sem with a bang', 'Recreational', 'N', 'g00089132', 34);

insert into event
values('CFF21', 'Escape if you Can!', 'Fall 2021', '20-SEP-2021', 'Zoom', '4:00 PM', '5:00 PM', 'Virtual Escape Room', 'Recreational', 'N', 'b00089801', 33);

insert into event
values('CTBTWPYF21', 'Build your own chatbot with Python!', 'Fall 2021', '13-OCT-2021', 'Zoom', '7:00 PM', '8:00 PM', 'Learn how to build your own chatbot using python', 'Educational', 'N', 'b00089801', 12);

insert into event
values('MUSEDITF21', 'Music Editing Workshop', 'Fall 2021', '15-NOV-2021', 'Zoom', '7:00 PM', '8:00 PM', 'Learn how to strike the right note with OSC', 'Informational', 'Y', 'b00089432', 17);

insert into event
values('TABOOS22', 'Game Show - Taboo', 'Spring 2022', '03-MAR-2022', 'Piano Room, SC', '5:00 PM', '6:00 PM', 'Come play Taboo: Open Source edition with us!', 'Recreational', 'N', 'g00089132', 23);

insert into event
values('CTFS22', 'Capture the Flag', 'Spring 2022', '24-MAR-2022', 'ESB1010', '6:00 PM', '8:00 PM', 'Programming competition with treasure hunt', 'Competition', 'N', 'b00092301', 79);

insert into event
values('GITHUBS22', 'Introducing Github', 'Spring 2022', '13-APR-2022', 'EB2-103', '3:30 PM', '4:30 PM', 'Learn about GitHub', 'Educational', 'Y', 'b00092301', 113);

insert into event
values('WEB3.0F22', 'Introduction to Web 3.0', 'Fall 2022', '11-OCT-2022', 'ESB1043', '5:00 PM', '6:00 PM', 'Introduction to Web 3.0 and its uses!', 'Informational', 'N', 'b00087698', 55);

insert into event
values('CARNF22', 'AUS Carnival', 'Fall 2022', '20-OCT-2022', 'AUS Football Field', '5:00 PM', '9:00 PM', 'Annual AUS Carnival hosted by all organizations', 'Recreational', 'Y', 'g00089132', 700);

insert into event
values('LINUXF22', 'Linux Workshop', 'Fall 2022', '29-NOV-2022', 'ESB1043', '5:00 PM', '6:00 PM', 'Learn about Linux and how it works!', 'Educational', 'Y', 'b00090070', 55);

insert into event
values('CFS23', 'Club Fair', 'Spring 2023', '14-FEB-2023', 'Student Center', '10:00 AM', '4:00 PM', 'Play a game of snakes and ladders with us.', 'Recreational', 'N', 'b00089801', NULL);

insert into event
values('CTF2.0S23', 'Capture the Flag 2.0', 'Spring 2023', '21-MAR-2023', 'ESB1010', '6:00 AM', '8:00 PM', 'Programming competition with treasure hunt.', 'Competition', 'N', 'b00092301', 102);

--collaborated events
insert into collaborated_events 
select * from event where Collaborated_Event='Y';

--collaborators
insert into collaborators
values('784-1969-1234567-1', 'Jon Snow', 'Palo Alto', 'jonsnow@paloalto.com', '1 (510) 775-2502', 'External');

insert into collaborators
values('784-2001-5675567-1', 'Meriam Mkadmi', 'IEEECS - AUS Chapter', 'g00083776@aus.edu', '971 56 240 1285', 'Internal');

insert into collaborators
values('784-2000-8885567-1', 'Rohan Mitra', 'IEEE - AUS Chapter', 'b00085023@aus.edu', '971 56 711 3632', 'Internal');

insert into collaborators
values('784-1979-8864567-1', 'Marwan Al-Shawi', 'Amazon Web Sevices', 'malshawi@aws.com', '1 (503) 604-4471', 'External');

insert into collaborators
values('784-2002-9985567-1', 'Safwan Khan', 'IEEESIGHT - AUS Chapter', 'b00088980@aus.edu', '971 52 805 5823', 'Internal');

insert into collaborators
values('784-1985-4398539-1', 'Dr. Albert Nasser Agha', 'American Univesity of Sharjah', 'aagha@aus.edu', '1 (773) 558-4160', 'Internal');

insert into collaborators
values('784-2002-9842592-1', 'Jovita Mariam Cherian', 'Entrepreneurship Club AUS', 'g00088852@aus.edu', '971 55 842 9070', 'Internal');

insert into collaborators
values('784-2001-3759259-1', 'Nour Eltaher', 'Gastronomy Club AUS', 'g00085697@aus.edu', '971 50 668 5817', 'Internal');

insert into collaborators
values('784-1971-2683533-1', 'Dr. Gerassimos Barlas', 'American Univesity of Sharjah', 'gbarlas@aus.edu', '971 56 125 4653', 'Internal');

--internal collaborators
insert into internal
values('784-2001-5675567-1', 'Meriam Mkadmi', 'IEEECS - AUS Chapter', 'g00083776@aus.edu', '971 56 240 1285', 'Internal', 'Computer Science and Engineering', 'CEN');

insert into internal
values('784-2000-8885567-1', 'Rohan Mitra', 'IEEE - AUS Chapter', 'b00085023@aus.edu', '971 56 711 3632', 'Internal', 'Electrical Engineering', 'CEN');

insert into internal
values('784-2002-9985567-1', 'Safwan Khan', 'IEEESIGHT - AUS Chapter', 'b00088980@aus.edu', '971 52 805 5823', 'Internal', 'Computer Science and Engineering', 'CEN');

insert into internal
values('784-1985-4398539-1', 'Dr. Albert Nasser Agha', 'American Univesity of Sharjah', 'aagha@aus.edu', '1 (773) 558-4160', 'Internal', 'Performing Arts', 'CAS');

insert into internal
values('784-2002-9842592-1', 'Jovita Mariam Cherian', 'Entrepreneurship Club AUS', 'g00088852@aus.edu', '971 55 842 9070', 'Internal', NULL, 'SBA');

insert into internal
values('784-2001-3759259-1', 'Nour Eltaher', 'Gastronomy Club AUS', 'g00085697@aus.edu', '971 50 668 5817', 'Internal', NULL, 'CAS');

insert into internal
values('784-1971-2683533-1', 'Dr. Gerassimos Barlas', 'American Univesity of Sharjah', 'gbarlas@aus.edu', '971 56 125 4653', 'Internal', 'Computer Science and Engineering', 'CEN');

--external collaborators
insert into external
values('784-1969-1234567-1', 'Jon Snow', 'Palo Alto', 'jonsnow@paloalto.com', '1 (510) 775-2502', 'External', 'Masters', 'San Franciso, USA', 'Canadian');

insert into external
values('784-1979-8864567-1', 'Marwan Al-Shawi', 'Amazon Web Sevices', 'malshawi@aws.com', '1 (503) 604-4471', 'External', 'Masters', 'Oregon, USA', 'Iraqi');

--event_collaborated
insert into event_collaborated
values('PALOALTF20', '784-1969-1234567-1');

insert into event_collaborated
values('PALOALTF20', '784-2001-5675567-1');

insert into event_collaborated
values('NNF20', '784-2000-8885567-1');

insert into event_collaborated
values('AWSF20', '784-1979-8864567-1');

insert into event_collaborated
values('IOTS21', '784-2002-9985567-1');

insert into event_collaborated
values('MUSEDITF21', '784-1985-4398539-1');

insert into event_collaborated
values('GITHUBS22', '784-2001-5675567-1');

insert into event_collaborated
values('CARNF22', '784-2002-9842592-1');

insert into event_collaborated
values('CARNF22', '784-2001-3759259-1');

insert into event_collaborated
values('LINUXF22', '784-1971-2683533-1');

--media content

insert into media_content
values('CFF20-01', 'g00090589', 'CFF20','Post','22-SEP-2020','Instagram',100,172);

INSERT INTO media_content
VALUES 
('PALOALTF20-01', 'b00093124', 'PALOALTF20', 'Post', '28-SEP-2020', 'Instagram', 27, 500);

INSERT INTO media_content
VALUES 
('NNF20-01', 'g00085270', 'NNF20', 'Post', '6-OCT-2020', 'Instagram', 31, 200);
INSERT INTO media_content
VALUES 
('MNF20-01', 'g00088567', 'MNF20', 'Post', '14-OCT-2020', 'Instagram', 50, 150);
INSERT INTO media_content
VALUES 
('AMNGUSF20-01', 'b00086276', 'AMNGUSF20', 'Post', '26-OCT-2020', 'Instagram', 46, 100);
INSERT INTO media_content
VALUES 
('AWSF20-01', 'g00088575', 'AWSF20', 'Post', '27-NOV-2020', 'Instagram', 34, 650);
INSERT INTO media_content
VALUES 
('ONLSECS21-01', 'b00091171', 'ONLSECS21', 'Post', '07-MARCH-2021', 'Instagram', 47, 1500);
INSERT INTO media_content
VALUES 
('IOTS21-01', 'b00091171', 'IOTS21', 'Post', '13-APR-2021', 'Instagram', 70, 700);
INSERT INTO media_content
VALUES 
('ONWOSCS21-01', 'g00094956', 'ONWOSCS21', 'Video', '04-MAY-2021', 'Instagram', 44, 219);
INSERT INTO media_content
VALUES 
('CFF21-01', 'b00094999', 'CFF21', 'Video', '19-SEP-2021', 'Instagram', 40, 210);
---
INSERT INTO media_content
VALUES 
('CTBTWPYF21-01', 'b00094999', 'CTBTWPYF21', 'Video', '12-OCT-2021', 'Instagram', 33, 210);

INSERT INTO media_content
VALUES 
('MUSEDITF21-01', 'b00088589', 'MUSEDITF21', 'Post', '15-NOV-2021', 'Instagram', 39, 210);
INSERT INTO media_content
VALUES 
('TABOOS22-01', 'g00090589', 'TABOOS22', 'Post', '02-FEB-2022', 'Instagram', 37, 88);
INSERT INTO media_content
VALUES 
('TABOOS22-02', 'b00093124', 'TABOOS22', 'Reel', '27-FEB-2022', 'Instagram', 35, 1566);
INSERT INTO media_content
VALUES 
('CTFS22-00', 'g00085270', 'CTFS22', 'Reel', '22-MAR-2022', 'Instagram', 33, 700);
INSERT INTO media_content
VALUES 
('CTFS22-01', 'g00088567', 'CTFS22', 'Reel', '23-MAR-2022', 'Instagram', 31, 219);
INSERT INTO media_content
VALUES 
('CTFS22-02', 'b00086276', 'CTFS22', 'Reel', '31-MAR-2022', 'Instagram', 100, 210);
INSERT INTO media_content
VALUES 
('GITHUBS22-01', 'g00088575', 'GITHUBS22', 'Reel', '12-APR-2022', 'Instagram', 27, 210);
INSERT INTO media_content
VALUES 
('WEB3.0F22-01', 'b00091171', 'WEB3.0F22', 'Reel', '08-OCT-2022', 'Instagram', 31, 210);

INSERT INTO media_content
VALUES 
('CARNF22-01', 'g00085270', 'CARNF22', 'Reel', '18-OCT-2022', 'Instagram', 100, 600);
INSERT INTO media_content
VALUES 
    ('CARNF22-02', 'b00093124', 'CARNF22', 'Reel', '21-OCT-2022', 'Instagram', 300, 1200);
    INSERT INTO media_content
VALUES 
    ('LINUXF22-01', 'g00094956', 'LINUXF22', 'Reel', '04-DEC-2022', 'Instagram', 50, 88);
    INSERT INTO media_content
VALUES 
    ('CFS23-01', 'g00088575', 'CFS23', 'Reel', '12-DEC-2022', 'Instagram', 46, 999);
    INSERT INTO media_content
VALUES 
    ('CTF2.0S23-00', 'b00094999', 'CTF2.0S23', 'Reel', '14-MAR-2023', 'Instagram', 50, 2067);
    INSERT INTO media_content
VALUES 
    ('CTF2.0S23-01', 'g00094956', 'CTF2.0S23', 'Reel', '19-MAR-2023', 'Instagram', 46, 988);
    INSERT INTO media_content
VALUES 
    ('CTF2.0S23-02', 'b00088589', 'CTF2.0S23', 'Reel', '30-MAR-2023', 'Instagram', 100, 700);
    INSERT INTO media_content
VALUES 
    ('TTS23-01', 'g00090589', NULL, 'Reel', '8-MAR-2023', 'Instagram', 55, 3000);
    INSERT INTO media_content
VALUES 
    ('TTS23-02', 'b00093124', NULL, 'Reel', '22-MAR-2023', 'Instagram', 31, 2100);
    INSERT INTO media_content
VALUES 
    ('TTS23-03', 'g00085270', NULL, 'Reel', '5-APR-2023', 'Instagram', 52, 5699);

--Budget

insert into Budget
values ('859043', 'CFF20', 100.00, 'Approved',97.50,2.50,'Fall 2020');

insert into Budget
values ('295710', 'PALOALTF20', 150.00, 'Approved', 150.00, 0.00, 'Fall 2020');

insert into Budget
values ('876502', 'MNF20', 50.00, 'Approved', 50.00, 0.00, 'Fall 2020');

insert into Budget
values ('140793', 'AMNGUSF20', 100.00, 'Approved', 100.75, -0.75, 'Fall 2020');

insert into Budget (Budget_ID, Event_ID, Amount_of_Budget, Budget_Status, Budget_Left, Academic_Term)
values('572819', 'AWSF20', 250.00, 'Approved', 250.00, 'Fall 2020');

INSERT INTO Budget
VALUES ('493628', 'ONLSECS21', 100.00, 'Approved', 78.20, 21.80, 'Spring 2021');

INSERT INTO Budget
VALUES ('926517', 'IOTS21', 100.00, 'Approved', 100.00, 0.00, 'Spring 2021');

INSERT INTO Budget
VALUES ('731984', 'ONWOSCS21', 100.00, 'Approved', 100.00, 0.00, 'Spring 2021');

INSERT INTO Budget
VALUES ('251768', 'CFF21', 100.00, 'Approved', 100.00, 0.00, 'Fall 2021');

INSERT INTO Budget
VALUES ('504219', 'TABOOS22', 200.00, 'Approved', 221.00, -21.00, 'Spring 2022');

INSERT INTO Budget
VALUES ('821076', 'CTFS22', 100.00, 'Approved', 94.30, 5.70, 'Spring 2022');

INSERT INTO Budget
VALUES ('165397', 'GITHUBS22', 100.00, 'Approved', 99.20, 0.80, 'Spring 2022');

INSERT INTO Budget
VALUES ('708263', 'WEB3.0F22', 100.00, 'Approved', 75.00, 25.00, 'Fall 2022');

INSERT INTO Budget
VALUES ('205150', 'CARNF22', 600.00, 'Approved', 600.00, 0.00, 'Fall 2022');

INSERT INTO Budget
VALUES ('437501', 'LINUXF22', 500.00, 'Approved', 458.00, 42.00, 'Fall 2022');

INSERT INTO Budget
VALUES ('954638', 'CFS23', 100.00, 'Approved', 100.00, 0.00, 'Spring 2023');

INSERT INTO Budget
VALUES ('320197', 'CTF2.0S23', 500.00, 'Approved', 450.00, 50.00, 'Spring 2023');

--Bills
INSERT INTO BILLS
VALUES ('CFF2004313201', 97.50,'g00089132','Noon','Card','Y','21-SEP-2020','859043','b00084833');

INSERT INTO BILLS 
VALUES ('PALOALTF207101322', 150.00, 'g00089132', 'Amazon', 'Card', 'Y', '28-SEP-2020', '295710', 'g00085775');

INSERT INTO BILLS 
VALUES ('MNF205021324', 50.00, 'g00089132', 'Amazon', 'Card', 'Y', '14-OCT-2020', '876502', 'g00085775');

INSERT INTO BILLS 
VALUES ('AMNGUSF207931325', 150.75, 'g00089132', 'Amazon', 'Card', 'Y', '14-OCT-2020', '140793', 'b00084833');

INSERT INTO BILLS 
VALUES ('ONLSECS216281327', 78.20, 'g00089132', 'Talabat', 'Card', 'Y', '08-MAR-2021', '493628', 'g00085775');

INSERT INTO BILLS 
VALUES ('IOTS215171328', 100.00, 'g00089132', 'Amazon', 'Card', 'Y', '14-APR-2021', '926517', 'b00084833');

INSERT INTO BILLS 
VALUES ('ONWOSCS219843859', 100.00, 'b00088385', 'Amazon', 'Card', 'Y', '05-MAY-2021', '731984', 'g00085775');

INSERT INTO BILLS 
VALUES ('CFF2176838510', 100.00, 'b00088385', 'Amazon', 'Card', 'Y', '20-SEP-2021', '251768', 'b00084833');

INSERT INTO BILLS 
VALUES ('TABOOS2221938513', 221.00, 'b00090070', 'Amazon', 'Cash', 'Y', '03-MAR-2022', '504219', 'b00084833');

INSERT INTO BILLS 
VALUES ('CTFS2207638514', 94.30, 'b00090070', 'Amazon', 'Cash', 'Y', '24-MAR-2022', '821076', 'g00085775');

INSERT INTO BILLS 
VALUES ('GITHUBS2239713215', 99.20, 'g00089132', 'Amazon', 'Cash', 'Y', '13-APR-2022', '165397', 'b00084833');

INSERT INTO BILLS 
VALUES ('WEB3.0F2226313216', 75.00, 'g00089132', 'Amazon', 'Cash', 'Y', '11-OCT-2022', '708263', 'b00084833');

INSERT INTO BILLS 
VALUES ('CARNF2215013221', 600.00, 'g00089132', 'Amazon', 'Cash', 'Y', '20-OCT-2022', '205150', 'b00084833');

INSERT INTO BILLS 
VALUES ('LINUXF2250113217', 458.00, 'g00089132', 'Amazon', 'Cash', 'Y', '29-OCT-2022', '437501', 'g00085775');

INSERT INTO BILLS
VALUES ('CFS2363813218', 100.00, 'g00089132', 'Amazon', 'Cash', 'Y', '14-FEB-2023', '954638', 'b00084833');

INSERT INTO BILLS
VALUES ('CTF2.0S2319713219', 150.00, 'g00089132', 'Talabat', 'Cash', 'N', '21-OCT-2023', '320197', 'g00085775');

INSERT INTO BILLS
VALUES ('CTF2.0S2319738520', 300.00, 'g00089132', 'Amazon', 'Cash', 'N', '21-OCT-2023', '320197', 'g00085775');



