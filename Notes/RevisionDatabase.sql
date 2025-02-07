IF EXISTS ( SELECT * FROM sys.databases
            WHERE name = 'MCAST')
BEGIN
USE MASTER;
DROP DATABASE MCAST;
END;

CREATE DATABASE MCAST;
GO

USE MCAST;

CREATE TABLE College
(
	CollegeID INTEGER PRIMARY KEY,
	CollegeName VARCHAR(50) NOT NULL UNIQUE
);
GO

INSERT INTO College
VALUES (1, 'Foundation College'),
       (2, 'Technical College'),
	   (3, 'University College');
GO

CREATE TABLE MQFLevel
(
	LevelID INTEGER PRIMARY KEY,
	CollegeID INTEGER NOT NULL REFERENCES College(CollegeID)
);

INSERT INTO MQFLevel
VALUES (1,1),
       (2,1),
	   (3,1),
	   (4,2),
	   (5,2),
	   (6,3),
	   (7,3);
GO

CREATE TABLE Town 
(
	TownID INTEGER PRIMARY KEY,
	TownName VARCHAR(70) NOT NULL UNIQUE
);


INSERT INTO Town
VALUES (1, 'Naxxar'),
       (2, 'Paola'),
	   (3, 'Mosta'),
	   (4, 'kalkara'),
	   (5, 'Ghajnsielem Gozo'),
       (6, 'Qormi');


CREATE TABLE Director
(
	DirectorID INTEGER PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Surname VARCHAR(50) NOT NULL,
	DateHired DATETIME NOT NULL
);
GO
 
INSERT INTO Director
VALUES (1, 'Tonio', 'Pace', '20180101'),
       (2, 'Malcolm', 'Borg','20151001'),
	   (3, 'Tyrone', 'Grima', '20080315'),
	   (4, 'David', 'Kenely', '20100131'),
	   (5, 'Philip', 'Vella', '20120606'),
	   (6, 'Ray', 'Vassallo', '20140203'),
	   (7, 'Conrad', 'Vassallo', '20160901'),
	   (8, 'Ray', 'Vassallo', '20090412'),
	   (9, 'Godwin', 'Grech', '20081201');
GO

CREATE TABLE Institute
(
	InstituteID INTEGER PRIMARY KEY,
	InstituteName VARCHAR(150) NOT NULL,
	Building VARCHAR(100) NOT NULL,
	Street VARCHAR(100) NOT NULL,
	TownID INTEGER NOT NULL REFERENCES Town(TownID),
	Telephone INTEGER NOT NULL,
	Fax INTEGER,
	Email VARCHAR(150) NOT NULL UNIQUE,
	DirectorID INTEGER REFERENCES Director(DirectorID)
)

INSERT INTO Institute
VALUES (1, 'Institute of Applied Sciences', 'MCAST Main Campus', 'Corradino Hill', 2, 23987369, NULL, 'ias@mcast.edu.mt', 1),
       (2, 'Institute of Applied Sciences', 'Centre for Agriculture, Aquatics and Animal Sciences', 'Luqa Road', 6, 23987340, NULL, 'CAAAS@mcast.edu.mt', 2),
	   (3, 'Institute for the Creative Arts', 'Misraħ Għonoq', 'Tarġa Gap', 3, 23987753, 21433205, 'adi@mcast.edu.mt', 3),
	   (4, 'Institute of Engineering and Transport' ,'Building and Construction', 'T/G fi Triq il-Kbira', 1, 21423626, 21423624, 'ibce@mcast.edu.mt', 6),
	   (5, 'Institute of Business Management and Commerce', 'MCAST Main Campus', 'Triq Kordin', 2, 23987600, 23987640,'ibac@mcast.edu.mt', 4),
	   (6, 'Institute of Community Services', 'MCAST Main Campus', 'Triq Kordin', 2, 23987550, 23987590, 'ics@mcast.edu.mt', 5),
	   (7, 'Institute of Engineering and Transport - Electrical and Electronics', 'MCAST Main Campus', 'Triq Kordin', 2, 23987700, NULL, 'eei@mcast.edu.mt', 8),
	   (8, 'Institute of Information and Communication Technology', 'MCAST Main Campus', 'Triq Kordin', 2, 23987350, 23987390, 'ict@mcast.edu.mt', 7),
	   (9, 'Institute of Engineering and Transport - Maritime', 'Villa Portelli', 'Triq Marina', 4, 23987768, 21809057, 'maritime@mcast.edu.mt',8),
	   (10, 'Institute of Engineering and Transport -  Mechanical', 'MCAST Main Campus', 'Triq Kordin', 2, 23987450, 23987490, 'ime@mcast.edu.mt', 8),
	   (11, 'MCAST Gozo Campus', 'MCAST Gozo Campus',  'JF De Chambray Street', 5, 23987665, NULL, 'gozocampus@mcast.edu.mt', 9);
GO

CREATE TABLE Course
(
	CourseId INTEGER PRIMARY KEY,
	CourseCode VARCHAR(25) NOT NULL,
	CourseName VARCHAR(150) NOT NULL,
	MQFLevel INTEGER NOT NULL REFERENCES MQFLevel(LevelID),
	AwardingBody VARCHAR(50) NOT NULL,
	Duration VARCHAR(25) NOT NULL,
	InstituteID INTEGER NOT NULL REFERENCES Institute(InstituteID)
)

INSERT INTO Course
VALUES  (1,'AG1-01-14','MCAST Introductory Certificate in Animal Husbandry and Horticultural Skills',1,'MCAST','1 Year (FT)',2),
	    (2,'AG2-01-14','MCAST Foundation Certificate in Horticulture and Animal Care',2,'MCAST','1 Year (FT)',2),
		(3,'AG3-01-14','MCAST Diploma in Animal Care',3,'MCAST','1 Year (FT)',2),
		(4,'AG3-02-14','MCAST Diploma in Fish Husbandry',3,'MCAST','1 Year (FT)',2),
		(5,'AG3-03-14','MCAST Diploma in Horticulture',3,'MCAST','1 Year (FT)',2),
		(6,'AS1-01-14','MCAST Introductory Certificate in Applied Science',1,'MCAST','1 Year (FT)',1),
		(7,'AS2-01-14','MCAST Foundation Certificate in Applied Science',2,'MCAST','1 Year (FT)',1),
		(8,'AS3-01-14','MCAST Diploma in Applied Science',3,'MCAST','1 Year (FT)',1),
		(9,'AG4-01-15','MCAST Advanced Diploma in Animal Management and Veterinary Nursing',4,'MCAST','2 Year (FT)',2),
		(10,'AG4-02-15','MCAST Advanced Diploma in Fish Management',4,'MCAST','2 Year (FT)',2),
		(11,'AG4-A3-16','MCAST Advanced Diploma in Horticulture',4,'MCAST','2 Year (FT)',2),
		(12,'AS4-01-14','MCAST Advanced Diploma for Pharmacy Technicians',4,'MCAST','2 Year (FT)',1),
		(13,'AS4-03-17','MCAST Advanced Diploma in Environmental Sustainability',4,'MCAST','2 Year (FT)',1),
		(14,'AS4-04-15','MCAST Advanced Diploma in Health Sciences',4,'MCAST','2 Year (FT)',1),
		(15,'AS4-A2-15','MCAST Advanced Diploma in Applied Science',4,'MCAST','2 Year (FT)',1),
		(16,'TC4-01-16','MCAST Advanced Diploma in Food Technology',4,'MCAST','2 Year (FT)',1),
		(17,'AG6-01-15','Bachelor of Science (Honours) in Animal Management and Veterinary Nursing',6,'MCAST','3 Year (FT)',2),
		(18,'AG6-02-15','Bachelor of Science (Honours) in Horticulture',6,'MCAST','3 Year (FT)',2),
		(19,'AG6-03-16','Bachelor of Science (Honours) in Fish Management',6,'MCAST','3 Year (FT)',2),
		(20,'AS6-01-15','Bachelor of Science (Honours) in Chemical Technology',6,'MCAST','3 Year (FT)',1),
		(21,'AS6-02-15','Bachelor of Science (Honours) in Environmental Engineering',6,'MCAST','3 Year (FT)',1),
		(22,'AS6-03-15','Bachelor of Science (Honours) in Health Science (Physiological Measurements)',6,'MCAST','3 Year (FT)',1),
		(23,'AS6-04-17','Northumbria University Bachelor of Science (Honours) in Nursing Studies',6,'MCAST','3 Year (FT)',1),
		(24,'AS6-05-17','Bachelor of Science (Honours) in Environmental Health',6,'MCAST','3 Year (FT)',1),
		(25,'AD1-01-14','MCAST Introductory Certificate in Art and Design',1,'MCAST','1 Year (FT)',3),
		(26,'AD3-01-14','MCAST Diploma in Art and Design',3,'MCAST','1 Year (FT)',3),
		(27,'AD3-02-15','MCAST Diploma in Performing Arts',3,'MCAST','1 Year (FT)',3),
		(28,'AD3-03-14','MCAST Diploma in Media',3,'MCAST','1 Year (FT)',3),
		(29,'CA2-01-16','MCAST Foundation Certificate in the Creative Arts',2,'MCAST','1 Year (FT)',3),
		(30,'CA3-01-17','MCAST Diploma in Printing',3,'MCAST','1 Year (FT)',3),
		(31,'AD4-02-15','MCAST Advanced Diploma in Creative Media Production',4,'MCAST','2 Year (FT)',3),
		(32,'CA4-02-17','MCAST Advanced Diploma in Graphic Design and Interactive Media',4,'MCAST','2 Year (FT)',3),
		(33,'CA4-03-16','MCAST Advanced Diploma in Performing Arts',4,'MCAST','2 Year (FT)',3),
		(34,'CA4-04-17','MCAST Advanced Diploma in Photography',4,'MCAST','2 Year (FT)',3),
		(35,'CA4-05-17','MCAST Advanced Diploma in Art and Design',4,'MCAST','2 Year (FT)',3),
		(36,'CA4-A1-17','MCAST Advanced Diploma in Fashion and Retail',4,'MCAST','2 Year (FT)',3),
		(37,'TC4-A2-16','MCAST Advanced Diploma in Cultural Heritage Skills',4,'MCAST','2 Year (FT)',3),
		(38,'AD6-01-15','Bachelor of Arts (Honours) in Creative Media Production',6,'MCAST','3 Year (FT)',3),
		(39,'AD6-02-15','Bachelor of Arts (Honours) in Fine Art',6,'MCAST','3 Year (FT)',3),
		(40,'AD6-03-15','Bachelor of Arts (Honours) in Game Art and Visual Design',6,'MCAST','3 Year (FT)',3),
		(41,'AD6-04-15','Bachelor of Arts (Honours) in Graphic Design',6,'MCAST','3 Year (FT)',3),
		(42,'AD6-05-15','Bachelor of Arts (Honours) in Interactive Media',6,'MCAST','3 Year (FT)',3),
		(43,'AD6-06-15','Bachelor of Arts (Honours) in Photography',6,'MCAST','3 Year (FT)',3),
		(44,'AD6-07-15','Bachelor of Arts (Honours) in Product Design',6,'MCAST','3 Year (FT)',3),
		(45,'AD6-08-15','Bachelor of Arts (Honours) in Spatial Design',6,'MCAST','3 Year (FT)',3),
		(46,'CA6-09-16','Bachelor of Arts (Honours) in Journalism',6,'MCAST','3 Year (FT)',3),
		(47,'BC1-01-14','MCAST Introductory Certificate in Business',1,'MCAST','1 Year (FT)',5),
		(48,'BC1-02-14','MCAST Award in Basic Office Skills',1,'MCAST','1 Year (FT)',5),
		(49,'BC2-01-14','MCAST Foundation Certificate in Business',2,'MCAST','1 Year (FT)',5),
		(50,'BC3-01-14','MCAST Diploma in Business',3,'MCAST','1 Year (FT)',5),
		(51,'BC3-A2-16','MCAST Diploma in Postal Services',3,'MCAST','1 Year (FT)',5),
		(52,'BC4-05-14','MCAST Advanced Diploma in Marketing',4,'MCAST','2 Years (FT)',5),
		(53,'BC4-A1-15','MCAST Advanced Diploma in Business Administration',4,'MCAST','2 Years (FT)',5),
		(54,'BC4-A2-16','MCAST Advanced Diploma in Insurance',4,'MCAST','2 Years (FT)',5),
		(55,'BC4-A3-16','MCAST Advanced Diploma in Accounting',4,'MCAST','2 Years (FT)',5),
		(56,'BC4-A4-15','MCAST Advanced Diploma in Financial Services',4,'MCAST','2 Years (FT)',5),
		(57,'BC4-A6-15','MCAST Advanced Diploma in Administrative and Secretarial Studies',4,'MCAST','2 Years (FT)',5),
		(58,'BC5-01-16','MCAST Higher Diploma for Accounting Technicians',5,'MCAST','2 Years (FT)',5),
		(59,'BC6-01-15','Bachelor of Arts (Honours) in Business Enterprise',6,'MCAST','3 Years (FT)',5),
		(60,'BC6-02-16','Bachelor of Science (Honours) in Financial Services Management',6,'MCAST','3 Years (FT)',5),
		(61,'CS1-01-14','MCAST Introductory Certificate in Care',1,'MCAST','1 Year (FT)',6),
		(62,'CS1-02-14','MCAST Introductory Certificate in Hairdressing',1,'MCAST','1 Year (FT)',6),
		(63,'CS2-01-14','MCAST Foundation Certificate in Care',2,'MCAST','1 Year (FT)',6),
		(64,'CS2-02-16','MCAST Foundation Certificate in Hairdressing, Beauty and Well-Being',2,'MCAST','1 Year (FT)',6),
		(65,'CS2-03-14','MCAST Foundation Certificate in Sport',2,'MCAST','1 Year (FT)',6),
		(66,'CS3-01-14','MCAST Diploma for Beauty Specialists',3,'MCAST','1 Year (FT)',6),
		(67,'CS3-03-14','MCAST Diploma in Health and Social Care',3,'MCAST','1 Year (FT)',6),
		(68,'CS3-04-14','MCAST Diploma in Sport',3,'MCAST','1 Year (FT)',6),
		(69,'CS3-05-17','MCAST Diploma in Foundation Studies for Security, Enforcement and Protection',3,'MCAST','1 Year (FT)',6),
		(70,'CS3-A2-14','MCAST Diploma in Hairdressing – Women',3,'MCAST','3 Years Apprenticeship',6),
		(71,'CS4-01-15','MCAST Advanced Diploma in Beauty and Complementary Therapies',4,'MCAST','2 Years (FT)',6),
		(72,'CS4-02-15','MCAST Advanced Diploma in Health and Social Care (Social Care)',4,'MCAST','2 Years (FT)',6),
		(73,'CS4-03-15','MCAST Advanced Diploma in Sport (Development, Coaching and Fitness)',4,'MCAST','2 Years (FT)',6),
		(74,'CS4-04-15','MCAST Advanced Diploma in Children’s Care, Learning and Development',4,'MCAST','2 Years (FT)',6),
		(75,'CS5-01-15','MCAST Higher Diploma in Advanced Studies in the Early Years',4,'MCAST','2 Years (FT)',6),
		(76,'CS5-02-16','MCAST Higher Diploma in Facilitating Inclusive Education',4,'MCAST','2 Years (FT)',6),
		(77,'CS6-01-15','Bachelor of Arts (Honours) in Health and Social Care (Management)',6,'MCAST','3 Years (FT)',6),
		(78,'CS6-02-17','Bachelor of Science (Honours) in Sport, Exercise and Health',6,'MCAST','3 Years (FT)',6),
		(79,'IT1-01-16','MCAST Introductory Certificate in ICT',1,'MCAST','1 Year (FT)',8),
		(80,'IT2-01-16','MCAST Foundation Certificate in ICT',2,'MCAST','1 Year (FT)',8),
		(81,'IT3-01-16','MCAST Diploma in ICT',3,'MCAST','1 Year (FT)',8),
		(82,'IT4-04-15','MCAST Advanced Diploma in IT (Software Development)',4,'MCAST','2 Years (FT)',8),
		(83,'IT4-A1-15','MCAST Advanced Diploma in IT (Computer Systems and Networks)',4,'MCAST','2 Years (FT)',8),
		(84,'IT4-03-15','MCAST Advanced Diploma in IT (Multimedia Software Development)',4,'MCAST','2 Years (FT)',8),
		(85,'IT4-A2-15','MCAST Advanced Diploma in IT (End User Support)',4,'MCAST','2 Years (FT)',8),
		(86,'IT6-01-15','Bachelor of Science (Honours) in Computer Systems and Networks',6,'MCAST','3 Years (FT)',8),
		(87,'IT6-02-15','Bachelor of Science (Honours) in Software Development',6,'MCAST','3 Years (FT)',8),
		(88,'IT6-03-15','Bachelor of Science (Honours) in Multimedia Software Development',6,'MCAST','3 Years (FT)',8),
		(89,'IT6-04-16','Bachelor of Science (Honours) in Business Analytics',6,'MCAST','3 Years (FT)',8),
		(90,'CE1-01-14G','MCAST Introductory Certificate in Construction Engineering',1,'MCAST','1 Year (FT)',11),
		(91,'CS2-01-14G','MCAST Foundation Certificate in Care',2,'MCAST','1 Year (FT)',11),
		(92,'CS2-02-16G','MCAST Foundation Certificate in Hairdressing, Beauty and Well-Being',2,'MCAST','1 Year (FT)',11),
		(93,'IT2-01-16G','MCAST Foundation Certificate in ICT',2,'MCAST','1 Year (FT)',11),
		(94,'GZ2-01-14G','MCAST Foundation Certificate in Engineering Skills',2,'MCAST','1 Year (FT)',11),
		(95,'AG2-01-14G','MCAST Foundation Certificate in Horticulture and Animal Care',2,'MCAST','1 Year (FT)',11),
		(96,'BC3-01-14G','MCAST Diploma in Business',3,'MCAST','1 Year (FT)',11),
		(97,'CS3-02-14 G','MCAST Diploma in Hairdressing – Women',3,'MCAST','1 Year (FT)',11),
		(98,'CS3-03-14G','MCAST Diploma in Health and Social Care',3,'MCAST','1 Year (FT)',11),
		(99,'CE3-02-14G','MCAST Diploma in Construction Engineering',3,'MCAST','1 Year (FT)',11),
		(100,'EE3-A1-16G','MCAST Diploma in Electrical Installations',3,'MCAST','1 Year (FT)',11),
		(101,'ME3-A3-14G','MCAST Diploma in Mechanical Engineering',3,'MCAST','1 Year (FT)',11),
		(102,'IT3-01-16G','MCAST Diploma in ICT',3,'MCAST','1 Year (FT)',11),
        (103,'BC4-A3-16G','MCAST Advanced Diploma in Accounting',4,'MCAST','2 Years Apprenticeship',11),
        (104,'BC4-A4-15G','MCAST Advanced Diploma in Financial Services',4,'MCAST','2 Years Apprenticeship',11),
		(105,'AS4-04-15G','MCAST Advanced Diploma in Health Sciences',4,'MCAST','2 Years (FT)',11),
		(106,'CS4-02-15G','MCAST Advanced Diploma in Health and Social Care (Social Care)',4,'MCAST','2 Years (FT)',11),
		(107,'CS4-04-15G','MCAST Advanced Diploma in Children’s Care, Learning and Development',4,'MCAST','2 Years (FT)',11),
		(108,'EE4-A2-14G','MCAST Advanced Diploma in Electrical Systems',4,'MCAST','2 Years (FT)',11),
		(109,'IT4-01-15G','MCAST Advanced Diploma in IT (Computer Systems and Networks)',4,'MCAST','2 Years (FT)',11),
		(110,'IT4-A2-15G','MCAST Advanced Diploma in IT (End User Support)',4,'MCAST','2 Years Apprenticeship',11),
		(111,'IT4-03-15G','MCAST Advanced Diploma in IT (Multimedia Software Development)',4,'MCAST','2 Years (FT)',11),
		(112,'IT4-04-15G','MCAST Advanced Diploma in IT (Software Development)',4,'MCAST','2 Years (FT)',11),
		(113,'BC5-01-16G','MCAST Higher Diploma for Accounting Technicians',5,'MCAST','2 Years (FT)',11),
		(114,'CS5-02-16G','MCAST Higher Diploma in Facilitating Inclusive Education',5,'MCAST','2 Years (FT)',11);
GO