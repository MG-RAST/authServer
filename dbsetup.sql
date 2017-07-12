CREATE TABLE user (login CHAR(20) PRIMARY KEY, password text NOT NULL, cookie text, name text, email text, confirmed BOOLEAN, admin BOOLEAN);
CREATE TABLE apps (application CHAR(50) PRIMARY KEY, url text NOT NULL, secret text NOT NULL);
CREATE TABLE accepts (login CHAR(20) PRIMARY KEY, application text NOT NULL, token text NOT NULL);
CREATE TABLE tokens (token CHAR(100) PRIMARY KEY, login text NOT NULL, created text NOT NULL);
CREATE TABLE scope (name CHAR(20) PRIMARY KEY, user text NOT NULL);
CREATE TABLE rights (type CHAR(20) PRIMARY KEY, item text, edit BOOLEAN, view BOOLEAN, scope text, owner BOOLEAN);
