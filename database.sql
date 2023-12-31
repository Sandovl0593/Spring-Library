CREATE SCHEMA sp_library;
SET SEARCH_PATH = 'sp_library';

CREATE TABLE IF NOT EXISTS userr (
    dni VARCHAR(8) PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS book (
    code VARCHAR(8) PRIMARY KEY NOT NULL,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genero VARCHAR(32) NOT NULL,
    editorial VARCHAR(100) NOT NULL,
    num_pages INTEGER NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    units_stock BIGINT NOT NULL
);

CREATE TABLE IF NOT EXISTS buy (
    boucher VARCHAR(8) PRIMARY KEY NOT NULL,
    client VARCHAR(8) NOT NULL,
    book_id VARCHAR(8) NOT NULL,
    units INTEGER NOT NULL,
    time_buy TIMESTAMP NOT NULL,   -- tiempo current de compra
);

CREATE TABLE IF NOT EXISTS stand (
    id INTEGER PRIMARY KEY NOT NULL,
    book_id VARCHAR(8) NOT NULL,
    owner VARCHAR(8) NOT NULL,
    units INTEGER NOT NULL   -- se acumula la cantidad que tiene y cada fila es
                             -- un libro unico
);

ALTER TABLE buy ADD CONSTRAINT buy_fk_user FOREIGN KEY (client) REFERENCES userr(dni);
ALTER TABLE buy ADD CONSTRAINT buy_fk_book FOREIGN KEY (book_id) REFERENCES book(code);
ALTER TABLE stand ADD CONSTRAINT stand_fk_owner FOREIGN KEY (owner) REFERENCES userr(dni);
ALTER TABLE stand ADD CONSTRAINT stand_fk_book FOREIGN KEY (book_id) REFERENCES book(code);