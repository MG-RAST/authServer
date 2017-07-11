CREATE TABLE user (login text NOT NULL UNIQUE, password text NOT NULL, cookie text, name text, email text, confirmed BOOLEAN, admin BOOLEAN);
CREATE TABLE apps (application text NOT NULL, url text NOT NULL, secret text NOT NULL);
CREATE TABLE accepts (login text NOT NULL UNIQUE, application text NOT NULL, token text NOT NULL);
CREATE TABLE tokens (token text NOT NULL UNIQUE, login text NOT NULL, created text NOT NULL);
CREATE TABLE scope (name text NOT NULL UNIQUE, user text NOT NULL);
CREATE TABLE rights (type text NOT NULL UNIQUE, item text, edit BOOLEAN, view BOOLEAN, scope text, owner BOOLEAN);
