CREATE TABLE genres(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name Text,
  PRIMARY KEY(id)
);

CREATE TABLE musicAlbum(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 genre INTEGER REFERENCES genres(id),
 author INTEGER REFERENCES authors(id),
 label INTEGER REFERENCES labels(id),
 publish_date DATE,
 on_spotify BOOLEAN,
 PRIMARY KEY(id)
);
