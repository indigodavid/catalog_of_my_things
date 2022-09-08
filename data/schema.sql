CREATE TABLE genres(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE labels (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  title TEXT,
  color TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE authors (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE musicAlbum(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  genre_id INTEGER,
  author_id INTEGER,
  label_id INTEGER,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  PRIMARY KEY(id)
  CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_genres FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_labels FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE games (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  author_id INTEGER,
  label_id INTEGER,
  genre_id INTEGER,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer VARCHAR(100),
  last_played_at DATE,
  PRIMARY KEY(id),
  CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_genres FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_labels FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE books (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  author_id INTEGER,
  label_id INTEGER,
  genre_id INTEGER,
  publish_date DATE,
  archived BOOLEAN,
  publisher TEXT,
  cover_state TEXT,
  PRIMARY KEY(id),
  CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_genres FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_labels FOREIGN KEY (label_id) REFERENCES labels(id)
);

