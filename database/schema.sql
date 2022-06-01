CREATE TABLE items(
    id SERIAL PRIMARY KEY,
    archived BOOLEAN DEFAULT 'f',
    author_id SERIAL NOT NULL,
    label_id SERIAL NOT NULL,
    genre_id SERIAL NOT NULL,
    publish_date TIMESTAMP NOT NULL,
    CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES author(id),
    CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES label(id),
    CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES genre(id)
);


CREATE TABLE genre(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    item_id SERIAL NOT NULL,
    CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE lables (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL,
);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE sources (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);

CREATE TABLE musicalbum (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN DEFAULT 'f',
    genre_id INT,
    CONSTRAINT genre_fk FOREIGN KEY (genre_id) REFERENCES genre(id)
);

Create INDEX genre_id_asc ON items(genre_id ASC);

CREATE INDEX genre_id_asc ON musicalbum(genre_id ASC);

DROP TABLE IF EXISTS authors;

CREATE TABLE authors (
    id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS games;

CREATE TABLE games (
    id INT PRIMARY KEY,
    multiplayer VARCHAR(100),
    last_played_at DATE NOT NULL,
    genre_id INT NOT NULL,
    lable_id INT NOT NULL,
    source_id INT NOT NULL,
    author_id INT NOT NULL,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    FOREIGN KEY genre_id REFERENCES genre (id),
    FOREIGN KEY lable_id REFERENCES lable (id),
    FOREIGN KEY author_id REFERENCES author (id),
    FOREIGN KEY source_id REFERENCES source (id)
);

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    author VARCHAR(100),
    label VARCHAR(100),
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    publish_date DATE,
    archived BOOLEAN,
    CONSTRAINT label_fk FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE label(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    item_id SERIAL NOT NULL,
    CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES items(id)
);

