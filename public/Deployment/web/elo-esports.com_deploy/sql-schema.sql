-- Create the database
CREATE DATABASE elo_sports;

-- Create the database user
CREATE USER 'elo_sports'@'localhost' IDENTIFIED BY 'elo_sports@123';

-- Grant privileges to the user for the elo_sports database
GRANT ALL PRIVILEGES ON elo_sports.* TO 'elo_sports'@'localhost';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;
