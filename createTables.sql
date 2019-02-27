CREATE UNLOGGED TABLE Degrees(DegreeId int, Dept varchar(50), DegreeDescription varchar(200), TotalECTS smallint);
CREATE UNLOGGED TABLE Students(StudentId int, StudentName varchar(50), Address varchar(200), BirthyearStudent smallint, Gender char);
CREATE UNLOGGED TABLE StudentRegistrationsToDegrees(StudentRegistrationId int, StudentId int, DegreeId int, RegistrationYear smallint);
CREATE UNLOGGED TABLE Teachers(TeacherId int, TeacherName varchar(50), Address varchar(200), BirthyearTeacher smallint, Gender char);
CREATE UNLOGGED TABLE Courses(CourseId int, CourseName varchar(50), CourseDescription varchar(200), DegreeId int, ECTS smallint);
CREATE UNLOGGED TABLE CourseOffers(CourseOfferId int, CourseId int, Year smallint, Quartile smallint);
CREATE UNLOGGED TABLE TeacherAssignmentsToCourses(CourseOfferId int, TeacherId int);
CREATE UNLOGGED TABLE StudentAssistants(CourseOfferId int, StudentRegistrationId int);
CREATE UNLOGGED TABLE CourseRegistrations(CourseOfferId int, StudentRegistrationId int, grade smallint);

CREATE UNLOGGED TABLE myPhonebook(id int, name varchar(50), address varchar(200), phoneNumber varchar(100));
COPY myPhonebook(id, name, address,phoneNumber) FROM '/mnt/ramdisk/tables/myphonebook.table' DELIMITER ',' CSV HEADER;

COPY Degrees(DegreeId, Dept, DegreeDescription, TotalECTS) FROM '/mnt/ramdisk/tables/Degrees.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY Students(StudentId, StudentName, Address, BirthyearStudent, Gender) FROM '/mnt/ramdisk/tables/Students.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY StudentRegistrationsToDegrees(StudentRegistrationId, StudentId, DegreeId, RegistrationYear) FROM '/mnt/ramdisk/tables/StudentRegistrationsToDegrees.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY Teachers(TeacherId, TeacherName, Address, BirthyearTeacher, Gender) FROM '/mnt/ramdisk/tables/Teachers.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY Courses(CourseId, CourseName, CourseDescription, DegreeId, ECTS) FROM '/mnt/ramdisk/tables/Courses.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY CourseOffers(CourseOfferId, CourseId, Year, Quartile) FROM '/mnt/ramdisk/tables/CourseOffers.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY TeacherAssignmentsToCourses(CourseOfferId, TeacherId) FROM '/mnt/ramdisk/tables/TeacherAssignmentsToCourses.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY StudentAssistants(CourseOfferId, StudentRegistrationId) FROM '/mnt/ramdisk/tables/StudentAssistants.table' DELIMITER ',' CSV HEADER NULL 'null';
COPY CourseRegistrations(CourseOfferId, StudentRegistrationId, grade) FROM '/mnt/ramdisk/tables/CourseRegistrations.table' DELIMITER ',' CSV HEADER NULL 'null';

ALTER TABLE Degrees add primary key (DegreeId);
ALTER TABLE Students add primary key (StudentId);
ALTER TABLE StudentRegistrationsToDegrees add primary key (StudentRegistrationId);
ALTER TABLE Teachers add primary key (TeacherId);
ALTER TABLE Courses add primary key (CourseId);
ALTER TABLE CourseOffers add primary key (CourseOfferId);
ALTER TABLE TeacherAssignmentsToCourses add primary key (CourseOfferId, TeacherId);
ALTER TABLE StudentAssistants add primary key (StudentRegistrationId, CourseOfferId);
ALTER TABLE CourseRegistrations add primary key (StudentRegistrationId, CourseOfferId);

ANALYZE
