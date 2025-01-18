# NetPrimeVideoApp_Database
Fictional streaming platform database designed

NetPrimeVideo_App SQL Database Project


Overview

The NetPrimeVideo_App SQL Database Project is a fictional streaming platform database designed to emulate the functionalities of a streaming app like Netflix. This project demonstrates a comprehensive database schema and includes tables for users, profiles, subscription plans, genres, movies, and watch history. It provides a structured approach to managing user data, content metadata, and viewing behavior.

Key Features
User Management: Track user information and subscription plans.

Profiles: Allow multiple profiles under a single user account.

Content Metadata: Store detailed information about movies and genres.

Subscription Plans: Define available subscription plans with features and pricing.

Watch History: Log viewing events, including watch duration and time.

Database Schema
The database follows a normalized structure with the following tables:

User_dim: Stores user information.
Profile_Dim: Manages individual profiles linked to user accounts.
Genre_Dim: Categorizes content by genre.
Movie_Dim: Stores details about movies and TV shows.
SubscriptionPlan_Dim: Defines subscription plans and their features.
WatchHistory_Fact: Captures watch events for analytics.
Entity-Relationship Diagram (ERD)
(Consider adding an ERD diagram here to visually represent the relationships between the tables.)

Implementation Details
SQL Features Demonstrated
Database creation and table definition.
Primary and foreign key constraints to enforce relationships.
Data insertion with sample data for testing and quality checks.
Structured query language (SQL) for data retrieval and integrity validation.
Sample SQL Queries
Retrieve all users and their subscription plans:

sql
Copy
Edit
SELECT First_Name, Last_Name, Subscription_Plan
FROM User_dim;
List all movies of a specific genre:

sql
Copy
Edit
SELECT Title, Genre_Name
FROM Movie_Dim
JOIN Genre_Dim ON Movie_Dim.Genre_ID = Genre_Dim.Genre_ID
WHERE Genre_Name = 'Action';
Analyze watch history by user:

sql
Copy
Edit
SELECT U.First_Name, U.Last_Name, M.Title, W.Watch_Date, W.Watch_Duration
FROM WatchHistory_Fact W
JOIN User_dim U ON W.User_ID = U.User_ID
JOIN Movie_Dim M ON W.Movie_ID = M.Movie_ID;

Dummy Data
The project includes extensive dummy data for all tables to enable testing and query validation. For instance:

Users: 20 sample users with various subscription plans.
Movies: 20 movies with metadata like release year, duration, and ratings.
Watch History: Sample viewing events for analytics.

Project Goals
Demonstrate proficiency in SQL, including database design, table relationships, and data manipulation.
Build a foundation for advanced data analytics projects, such as tracking user preferences and streaming behavior.
Provide a portfolio-ready project that highlights SQL skills.

How to Use Clone the repository.
Execute the SQL scripts sequentially in your SQL environment (e.g., MySQL, SQL Server).
Run the provided quality checks and sample queries to validate the data and schema.

Future Enhancements
Incorporate advanced analytics queries to derive insights from watch history.
Extend the schema to include TV show episodes and series.
Build a front-end visualization using tools like Tableau or Power BI for analytics.

Technologies Used
SQL Server for database creation and management.
Sample data and queries for testing.

Author
This project was created as part of my SQL portfolio to demonstrate skills in database design and query development. For questions or collaboration, feel free to connect with me!
