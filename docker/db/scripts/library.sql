CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.publishing_house (
    id VARCHAR(36) PRIMARY KEY,
    house_name TEXT NOT NULL,
    house_address TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS library.book (
    isbn VARCHAR(15) PRIMARY KEY,
    year_of_publishment INTEGER NOT NULL,
    book_name TEXT NOT NULL,
    author TEXT NOT NULL,
    pages_number INTEGER NOT NULL,
    publishing_house_id VARCHAR(36) NOT NULL REFERENCES library.publishing_house(id)
);

CREATE TABLE IF NOT EXISTS library.book_copy (
    id VARCHAR(36) PRIMARY KEY,
    book_isbn VARCHAR(15) NOT NULL REFERENCES library.book(isbn),
    position INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS library.category (
    id VARCHAR(36) PRIMARY KEY,
    category_name TEXT NOT NULL,
    master_category_id VARCHAR(36) REFERENCES library.category(id),
    book_isbns VARCHAR(15)
);

CREATE TABLE book_category (
    book_isbn VARCHAR(15) REFERENCES library.book(isbn),
    category_id VARCHAR(36) REFERENCES library.category(id),
    PRIMARY KEY(book_isbn, category_id)
);

CREATE TABLE IF NOT EXISTS library.visitor (
    id VARCHAR(36) PRIMARY KEY,
    visitor_name TEXT NOT NULL,
    visitor_surname TEXT NOT NULL,
    visitor_adress TEXT NOT NULL,
    visitor_birthday TIMESTAMPTZ NOT NULL
);

CREATE TABLE IF NOT EXISTS library.taken_book_application (
    id VARCHAR(36) PRIMARY KEY,
    book_isbn VARCHAR(15) NOT NULL REFERENCES library.book(isbn),
    copy_id VARCHAR(36) NOT NULL REFERENCES library.book_copy(id),
    visitor_id VARCHAR(36) NOT NULL REFERENCES library.visitor(id),
    return_date TIMESTAMPTZ NOT NULL,
    is_returned BOOLEAN DEFAULT FALSE
);