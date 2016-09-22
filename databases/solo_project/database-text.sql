CREATE TABLE talk_shows (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  host VARCHAR(255),
  first_day DATE,
  on_air BOOLEAN,
  genre_id INT,
  FOREIGN KEY (genre_id) REFERENCES talk_show_genres(id)
  );

CREATE TABLE talk_show_genres (
  id INTEGER PRIMARY KEY,
  genre VARCHAR(255)
  );

INSERT INTO talk_show_genres (genre) VALUES ("Daytime");
INSERT INTO talk_show_genres (genre) VALUES ("Late Night");
INSERT INTO talk_show_genres (genre) VALUES ("Sunday Morning");


INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "The RuPaul Show",
    "RuPaul",
    '1996-10-12',
    "false",
    1
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "Watch What Happens Live",
    "Andy Cohen",
    '2009-07-16',
    "true",
    1
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "Chelsea Lately",
    "Chelsea Handler",
    '2007-07-16',
    "false",
    2
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "Politically Incorrect",
    "Bill Mahr",
    '1993-07-25',
    "false",
    2
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "The Tonight Show",
    "Jimmy Fallon",
    '1954-09-27',
    "true",
    2
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "The Joan Rivers Show",
    "Joan Rivers",
    '1989-09-05',
    "false",
    1
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "The Wendy Williams Show",
    "Wendy Williams",
    '2008-07-14',
    "true",
    1
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "Montel",
    "Montel Williams",
    '1991-09-30',
    "false",
    1
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "Meet The Press",
    "Chuck Todd",
    '1947-11-06',
    "true",
    3
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "Face the Nation",
    "John Dickerson",
    '1954-11-07',
    "true",
    3
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "Al Punto",
    "Jorge Ramos",
    '2007-09-09',
    "true",
    3
    );

INSERT INTO talk_shows (title, host, first_day, on_air, genre_id) VALUES (
    "The McLaughlin Group",
    "John McLaughlin",
    '2007-09-09',
    "true",
    3
    );