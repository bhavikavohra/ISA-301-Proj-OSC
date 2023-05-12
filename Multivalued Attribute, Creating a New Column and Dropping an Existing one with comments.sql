Alter table member ---- Alter member table by adding an attribute/column called Second_major 
add SECONDARY_MAJOR VARCHAR (35);

-- Update member with secondary major values

update member 
set secondary_major = 'Economics'
where aus_id = 'g00085775';

update member 
set secondary_major = 'Mathematics'
where aus_id = 'b00089801';

update member 
set secondary_major = 'Music'
where aus_id = 'b00093124';

------ Add SECONDARY_MAJOR column to media_team

alter table media_team
add SECONDARY_MAJOR VARCHAR (35);

-- Add SECONDARY_MAJOR column to executive_team

alter table executive_team
add SECONDARY_MAJOR VARCHAR (35);

-- Add SECONDARY_MAJOR column to activities_team

alter table activities_team
add SECONDARY_MAJOR VARCHAR (35);

-------------

-- Update executive_team with secondary major values

update executive_team
set secondary_major = 'Economics'
where aus_id = 'g00085775';

-- Update activities_team with secondary major values

update activities_team 
set secondary_major = 'Mathematics'
where aus_id = 'b00089801';

-- Update media_team with secondary major values

update media_team
set secondary_major = 'Music'
where aus_id = 'b00093124';

-- Add bill_description column to bills table

alter table bills
add bill_description varchar (100);

-- Update bills with bill_description values

update bills
set bill_description = 'gift card'
where bill_no = 'PALOALTF207101322';

update bills
set bill_description = 'printing customized taboo cards'
where bill_no = 'TABOOS2221938513';

--adding minor 1, minor2 columns in members tables
Alter table member
add minor1 VARCHAR (35);

Alter table member
add minor2 VARCHAR (35);

-- Add minor1 and minor2 columns to media_team table

alter table media_team
add minor1 VARCHAR (35);

alter table media_team
add minor2 VARCHAR (35);

-- Add minor1 and minor2 columns to executive_team table

alter table executive_team
add minor1 VARCHAR (35);

alter table executive_team
add minor2 VARCHAR (35);

-- Add minor1 and minor2 columns to activities_team table

alter table activities_team
add minor1 VARCHAR (35);

alter table activities_team
add minor2 VARCHAR (35);

------------------------

-- Update member with minor1 and minor2 values

update member 
set minor1 = 'Economics'
where aus_id = 'g00089132';

update member 
set minor1 = 'Data Science'
where aus_id = 'b00090070';


update member 
set minor1 = 'Data Science'
where aus_id = 'g00085775';

update member 
set minor2 = 'Music'
where aus_id = 'g00085775';

update member 
set minor1 = 'Data Science'
where aus_id = 'b00084833';

update member 
set minor2 = 'Applied Computational Mathematics'
where aus_id = 'b00084833';

----------------------------------

-- Update activities_team with minor1 values

update activities_team
set minor1 = 'Economics'
where aus_id = 'g00089132';

update activities_team
set minor1 = 'Data Science'
where aus_id = 'b00090070';

-- Update executive_team with minor1 and minor2 values

update executive_team
set minor1 = 'Data Science'
where aus_id = 'g00085775';

update executive_team 
set minor2 = 'Music'
where aus_id = 'g00085775';

update executive_team
set minor1 = 'Data Science'
where aus_id = 'b00084833';

update executive_team 
set minor2 = 'Applied Computational Mathematics'
where aus_id = 'b00084833';

--dropping the platform column in our media_content table
alter table Media_Content
drop column platform;

--------------------------------------------------------------

