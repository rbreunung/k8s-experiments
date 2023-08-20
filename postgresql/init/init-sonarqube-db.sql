CREATE USER sonarqube;
ALTER USER sonarqube WITH PASSWORD 'sonarqube-password';
CREATE DATABASE sonarqube;
GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonarqube;