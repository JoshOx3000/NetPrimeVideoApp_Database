-- Creation of Database
CREATE DATABASE NetPrimeVideo_App;

use NetPrimeVideo_App;

CREATE TABLE User_dim (
    User_ID INT IDENTITY(1,1) PRIMARY KEY,           
    First_Name VARCHAR(50) NOT NULL,                  
    Last_Name VARCHAR(50) NOT NULL,                   
    Email VARCHAR(50) NOT NULL,                       
    Subscription_Plan VARCHAR(25) NOT NULL,           
    Created_Date DATE NOT NULL                        
)
;


-- check to see if the table creation done properly
SELECT *
FROM User_dim
;

-- Creation of the Profile table - 
-- Profile Table: Manage individual profiles under a user account.

CREATE TABLE Profile_Dim (
	Profile_ID INT IDENTITY(1,1) PRIMARY KEY,
	User_ID INT NOT NULL,
	Profile_Name VARCHAR(50) NOT NULL,
	Perferences VARCHAR(50),
	FOREIGN KEY (user_id) REFERENCES user_dim(user_id)
)
;

-- Quality Check: ensure the table was created and able to be viewed
SELECT *
FROM Profile_Dim
;


-- Creation of Genre Table
-- Genre Table: Categorize content based on genre
CREATE TABLE Genre_Dim (
	Genre_ID INT IDENTITY(1,1) PRIMARY KEY,
	Genre_Name VARCHAR(50)
);

-- Creation of the Movie table
-- Movie Table:  Stores any details about the movies and TV shows

CREATE TABLE Movie_Dim (
	Movie_ID INT IDENTITY(1,1)  PRIMARY KEY,
	Title VARCHAR(50) NOT NULL,
	Release_Year INT NOT NULL,
	Genre_ID INT FOREIGN KEY REFERENCES Genre_Dim(Genre_ID),
	Duration INT NOT NULL,
	Rating DECIMAL(3,2) NOT NULL
);

-- Quality Check: ensure the table was created and able to be viewed
SELECT *
FROM Genre_Dim
;

-- Creation of SubscriptionPlan table
-- SubscriptionPlan: Stores the details about subscription plans

CREATE TABLE SubscriptionPlan_Dim (
	Plan_ID INT IDENTITY(1,1) PRIMARY KEY,
	Plan_name VARCHAR(50) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Features VARCHAR(100)
)
;


-- Quality Check: ensure the table was created and able to be viewed
SELECT *
FROM SubscriptionPlan_Dim
;


-- Creation of the WatchHistory Table
-- WatchHistory: Stores streaming events, capturing measurable data such as watch duration and time
CREATE TABLE WatchHistory_Fact (
	Watch_ID  INT IDENTITY(1,1) PRIMARY KEY,
	User_ID INT FOREIGN KEY REFERENCES User_dim(user_id) NOT NULL,
	Profile_ID INT FOREIGN KEY REFERENCES  Profile_DIM(Profile_ID) NOT NULL,
	Movie_ID INT FOREIGN KEY REFERENCES Movie_Dim(Movie_ID) NOT NULL,
	watch_Date DATE NOT NULL,
	Watch_Time TIME NOT NULL,
	Watch_Duration INT NOT NULL
)
; 

-- Quality Check: ensure the table was created and able to be viewed
SELECT *
FROM WatchHistory_Fact
;


-- Insert dummy data into User_dim table
INSERT INTO User_dim (First_Name, Last_Name, Email, Subscription_Plan, Created_Date) 
VALUES
('John', 'Doe', 'john.doe@example.com', 'Premium', '2022-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', 'Standard', '2021-12-10'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'Basic', '2022-07-20'),
('Bob', 'Brown', 'bob.brown@example.com', 'Premium', '2022-03-22'),
('Charlie', 'Davis', 'charlie.davis@example.com', 'Standard', '2022-04-10'),
('David', 'Miller', 'david.miller@example.com', 'Basic', '2022-08-30'),
('Emily', 'Wilson', 'emily.wilson@example.com', 'Premium', '2021-10-11'),
('Frank', 'Moore', 'frank.moore@example.com', 'Standard', '2022-01-12'),
('Grace', 'Taylor', 'grace.taylor@example.com', 'Premium', '2021-06-05'),
('Hannah', 'Anderson', 'hannah.anderson@example.com', 'Basic', '2022-09-01'),
('Isabel', 'Thomas', 'isabel.thomas@example.com', 'Premium', '2022-04-25'),
('James', 'Martinez', 'james.martinez@example.com', 'Standard', '2022-05-15'),
('Katherine', 'Lopez', 'katherine.lopez@example.com', 'Basic', '2022-06-10'),
('Liam', 'Harris', 'liam.harris@example.com', 'Premium', '2022-07-22'),
('Mia', 'Clark', 'mia.clark@example.com', 'Standard', '2022-03-05'),
('Noah', 'Walker', 'noah.walker@example.com', 'Basic', '2022-08-18'),
('Olivia', 'Allen', 'olivia.allen@example.com', 'Premium', '2022-09-09'),
('Paul', 'Young', 'paul.young@example.com', 'Standard', '2022-04-30'),
('Quincy', 'King', 'quincy.king@example.com', 'Premium', '2022-01-08'),
('Rachel', 'Scott', 'rachel.scott@example.com', 'Basic', '2022-10-15')
;

-- Quality check
SELECT *
FROM User_dim
;
-- test passed, data enter properly


INSERT INTO Profile_Dim (User_ID, Profile_Name, Perferences) 
VALUES
(1, 'John_Profile', 'Action, Comedy'),
(2, 'Jane_Profile', 'Drama, Thriller'),
(3, 'Alice_Profile', 'Romance, Sci-Fi'),
(4, 'Bob_Profile', 'Action, Fantasy'),
(5, 'Charlie_Profile', 'Comedy, Drama'),
(6, 'David_Profile', 'Horror, Thriller'),
(7, 'Emily_Profile', 'Action, Adventure'),
(8, 'Frank_Profile', 'Documentary, History'),
(9, 'Grace_Profile', 'Action, Sci-Fi'),
(10, 'Hannah_Profile', 'Romance, Adventure'),
(11, 'Isabel_Profile', 'Horror, Thriller'),
(12, 'James_Profile', 'Action, Sci-Fi'),
(13, 'Katherine_Profile', 'Comedy, Romance'),
(14, 'Liam_Profile', 'Adventure, Action'),
(15, 'Mia_Profile', 'Romance, Drama'),
(16, 'Noah_Profile', 'Sci-Fi, Fantasy'),
(17, 'Olivia_Profile', 'Adventure, Action'),
(18, 'Paul_Profile', 'Documentary, Sci-Fi'),
(19, 'Quincy_Profile', 'Action, Fantasy'),
(20, 'Rachel_Profile', 'Drama, Romance')
;

-- Quality check
SELECT *
FROM Profile_Dim
;

-- Passed Quality check, All data is inserted  properly


INSERT INTO Genre_Dim (Genre_Name) 
VALUES
('Action'),
('Comedy'),
('Drama'),
('Thriller'),
('Romance'),
('Sci-Fi'),
('Fantasy'),
('Horror'),
('Adventure'),
('Documentary'),
('Mystery'),
('Animation'),
('Family'),
('Crime'),
('Musical'),
('Biography'),
('History'),
('Sport'),
('War'),
('Western')
;

-- Quality check
SELECT *
FROM Genre_Dim
;

-- Passed Quality check, All data is inserted  properly


INSERT INTO Movie_Dim (Title, Release_Year, Genre_ID, Duration, Rating) 
VALUES
('The Matrix', 1999, 6, 136, 8.7),
('The Dark Knight', 2008, 1, 152, 9.0),
('Inception', 2010, 6, 148, 8.8),
('Titanic', 1997, 5, 195, 7.8),
('The Shawshank Redemption', 1994, 3, 142, 9.3),
('Forrest Gump', 1994, 3, 142, 8.8),
('The Godfather', 1972, 3, 175, 9.2),
('Interstellar', 2014, 6, 169, 8.6),
('The Hobbit: An Unexpected Journey', 2012, 7, 169, 7.8),
('The Conjuring', 2013, 8, 112, 7.5),
('Frozen', 2013, 12, 102, 7.4),
('The Lion King', 1994, 12, 88, 8.5),
('Pulp Fiction', 1994, 1, 154, 8.9),
('Gladiator', 2000, 7, 155, 8.5),
('Jurassic Park', 1993, 1, 127, 8.1),
('Avatar', 2009, 6, 162, 7.8),
('The Prestige', 2006, 6, 130, 8.5),
('The Silence of the Lambs', 1991, 3, 118, 8.6),
('The Departed', 2006, 1, 151, 8.5),
('Guardians of the Galaxy', 2014, 6, 121, 8.0)
;

-- Quality check
SELECT *
FROM Movie_Dim
;

-- Passed Quality check, All data is inserted  properly

INSERT INTO SubscriptionPlan_Dim ( Plan_Name, Price, Features)
VALUES 
    ('Basic', 8.99, 'Single Screen, SD Quality'),
    ('Standard', 12.99, 'Two Screens, HD Quality'),
    ('Premium', 15.99, 'Four Screens, 4K Quality'),
    ('Trial', 0.00, 'Single Screen, SD Quality, 7-day Trial')
;


-- Quality check
SELECT *
FROM SubscriptionPlan_Dim
;

-- Passed Quality check, All data is inserted  properly

INSERT INTO WatchHistory_Fact (User_ID, Profile_ID, Movie_ID, watch_Date, Watch_Time, Watch_Duration) 
VALUES
(1, 1, 1, '2022-09-05', '19:00:00', 120),
(2, 2, 2, '2022-09-06', '20:15:00', 130),
(3, 3, 3, '2022-09-07', '21:00:00', 140),
(4, 4, 4, '2022-09-08', '18:45:00', 150),
(5, 5, 5, '2022-09-09', '22:00:00', 110),
(6, 6, 6, '2022-09-10', '19:30:00', 160),
(7, 7, 7, '2022-09-11', '20:30:00', 135),
(8, 8, 8, '2022-09-12', '21:15:00', 125),
(9, 9, 9, '2022-09-13', '22:45:00', 140),
(10, 10, 10, '2022-09-14', '19:00:00', 115),
(11, 11, 11, '2022-09-15', '20:00:00', 125),
(12, 12, 12, '2022-09-16', '19:45:00', 120)
;

-- Quality check
SELECT *
FROM WatchHistory_Fact
;

-- Passed Quality check, All data is inserted  properly


-- Creation of the Store Procedures

-- AddNewUser: 
CREATE PROCEDURE AddNewUser
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@Email VARCHAR(50),
	@SubscriptionPlan VARCHAR(25),
	@Created_Date DATE
AS
BEGIN
	INSERT INTO User_dim(First_Name, Last_Name, Email, Subscription_Plan, Created_Date)
	VALUES(@FirstName, @LastName, @Email, @SubscriptionPlan, @Created_Date)
END
;

-- Quality test
EXEC AddNewUser
	@FirstName = 'Luke',
	@LastName = 'Skywalker',
	@Email = 'lukeskywalker@noemailexist.com',
	@SubscriptionPlan = 'Premium',
	@Created_Date = '2025-01-01'
;

SELECT *
FROM User_dim
WHERE First_Name = 'Luke'
;

-- Passed works fine

-- Creation of UpdateUserSubscription: 
CREATE PROCEDURE UpdateUserSubscription
	@UserID int,
	@NewSubscriptionPlan varchar(25)
AS 
BEGIN
	UPDATE User_dim
	SET Subscription_Plan = @NewSubscriptionPlan
	WHERE User_ID = @UserID
END
;

-- Quality test

EXEC UpdateUserSubscription
	@userid = 21,
	@NewSubscriptionPlan = 'Basic'
;

SELECT *
FROM User_dim
WHERE User_ID = 21
;

-- Passed Quality test, Store Procedure UpdateUserSubscription works properly

-- Creation of DeleteUser Store Procedure: remove user
CREATE PROCEDURE DeleteUser
	@UserID INT
AS
BEGIN
	DELETE FROM User_dim
	WHERE User_ID = @UserID
END
;

-- Quality Check- ensure store procedurfe working properly

EXEC DeleteUser
	@userid = 21
;

-- Test Passed remove userid = 21 properly

-- Creation of GetWatchHistory
CREATE PROCEDURE GetWatchHistory
	@userID INT
AS
BEGIN
	SELECT
		WH.Watch_ID,
		M.Title,
		WH.Watch_Time,
		WH.Watch_Duration
	FROM WatchHistory_Fact wh
	INNER JOIN Movie_Dim M ON WH.Movie_ID = M.Movie_ID
	WHERE Wh.User_ID = @userID
END
;

-- Quality Check
EXEC GetWatchHistory
	@UserID = 1
;

-- Passed Quality Check, Works Properly

-- Store Procedure AddNewMovie: to add new movies to movie table
CREATE PROCEDURE AddNewMovie
	@Title VARCHAR(50),
	@Release_Year INT,
	@Genre_ID INT,
	@Duration INT,
	@Rating DECIMAL(3,2)
AS 
BEGIN
	INSERT INTO Movie_Dim(Title, Release_Year, Genre_ID, Duration, Rating)
	VALUES(@Title, @Release_Year, @Genre_ID, @Duration, @Rating)
END
;

-- Quality Check
EXEC AddNewMovie
	@Title = 'Blade Runner',
	@Release_Year = 1982,
	@Genre_ID = 6,
	@Duration = 110,
	@Rating = 9.00
;

SELECT *
FROM Movie_Dim
WHERE title = 'Blade Runner'
;

-- Passed Quality check, test entry added successfully

-- Creation of GetUsersBySubscriptionPlan
CREATE PROCEDURE GetUsersBySubscriptionPlan
	@Subscription_Plan VARCHAR(25)
AS
BEGIN
	SELECT
		User_ID,
		First_Name,
		Last_Name,
		Email,
		Created_Date
	FROM User_dim
	WHERE Subscription_Plan = @Subscription_Plan
END
;

-- Quality Check
EXEC GetUsersBySubscriptionPlan
	@Subscription_Plan = 'Basic'
;

-- Passed Quality Check


-- Creation of GetPopularMovies: Retrieve movies sorted by their ratings.
CREATE PROCEDURE GetPopularMovies
AS
BEGIN
	SELECT
		Title,
		Release_Year,
		Rating
	FROM Movie_Dim
	ORDER BY rating DESC
END

-- Quality Check 
EXEC GetPopularMovies;

-- Passed Quality- GetPopularMovies Store Procedure works properly

-- Creation of SearchMoviesByGenre: Find all movies of a specific genre
CREATE PROCEDURE SearchMoviesByGenre
	@GenreName VARCHAR(50)
AS
BEGIN
	SELECT
		m.Title,
		m.Release_Year,
		m.Rating
	FROM Movie_Dim m
	INNER JOIN  Genre_Dim g
		ON m.Genre_ID = g.Genre_ID
	WHERE g.Genre_Name = @GenreName
END
;

-- Quality Check
EXEC SearchMoviesByGenre
	@GenreName = 'Sci-Fi'
;

-- SearchMoviesByGenre Stored Procedure passed all tests, works properly

-- Creation of Store Procedure GetMonthlyWatchStats: generate watch statistics(total watch time, number of movies) for a specific month
CREATE PROCEDURE GetMonthlyWatchStats
	@Month INT,
	@Year INT
AS
BEGIN
	SELECT
		COUNT(*) AS TotalMoviesWatched,
		SUM(Watch_Duration) AS TotalWatchTime
	FROM WatchHistory_Fact
	WHERE MONTH(Watch_date)= @Month AND YEAR(Watch_Date) = @Year
END
;

-- Quality Check
EXEC GetMonthlyWatchStats
	@Month = 10,
	@Year = 2022
;
-- passed testing, works fine


-- Creation of  Store Procedure DeleteUserProfile: delete a user profile
CREATE PROCEDURE DeleteUserProfile
	@ProfileID INT
AS
BEGIN
	IF EXISTS (
		SELECT 1
		FROM WatchHistory_Fact
		WHERE Profile_ID = @ProfileID
	)
	BEGIN
		Print 'Error: Cannot delete profile with existing watch history.';
	END
	ELSE
	BEGIN
		DELETE FROM Profile_Dim
		WHERE Profile_ID = @ProfileID
		PRINT 'Profile deleted successfully'
	END
END
;
