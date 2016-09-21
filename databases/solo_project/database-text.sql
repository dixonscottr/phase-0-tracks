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