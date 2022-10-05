PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
CREATE TABLE user( 
    userid int primary key, 
    fname text, 
    lname text, 
    passwrd varchar(20), 
    UNIQUE(passwrd)
);

CREATE TABLE games (
    gamesid int primary key,
    userid int,
    answerid int,
    gameid int,
    FOREIGN KEY(userid) REFERENCES user(userid),
    FOREIGN KEY (answerid) REFERENCES answer(answerid),
    FOREIGN KEY(gameid) REFERENCES game(gameid)
);

CREATE TABLE game(
    gameid int primary key,
    guesses int
);

CREATE TABLE guess(
    guessid int primary key,
    gameid int,
    guessedword varchar(5),
    accuracy varchar(5),
    FOREIGN KEY(gameid) REFERENCES game(gameid)
);

CREATE TABLE answer(
    answerid int primary key,
    answord varchar(5)
);

CREATE TABLE valid_word(
    valid_id int primary key,
    valword varchar(5)
);
COMMIT;
