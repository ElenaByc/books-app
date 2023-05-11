"""CRUD operations."""

from model import (User, Book, Shelf, Author, Subject, Cover,
                   BookSubject, BookAuthor, BookShelf,
                   db, connect_to_db)


def create_user(email, password):
    """Create and return a new user."""

    return User(email=email, password=password)


def create_book(title, isbn10, isbn13, overview=""):
    """Create and return a new book."""

    return Book(title=title, primary_isbn10=isbn10, primary_isbn13=isbn13, overview=overview)


def create_subject(subject, nyt_list_name):
    """Create and return a new subject."""

    return Subject(subject=subject, nyt_list_name_encoded=nyt_list_name)


def create_author(name, about, picture):
    """Create and return a new author."""

    return Author(name=name, about=about, picture_url=picture)


def create_shelf(name, about, picture):
    """Create and return a new shelf."""

    return Shelf(name=name, about=about, picture_url=picture)


def create_cover(book, img_url):
    """Create and return a new book cover."""

    return Cover(book=book, img_url=img_url)


def create_book_subject(book, subject):
    """Create and return a new book-subject association."""

    return BookSubject(book=book, subject=subject)


def create_book_author(book, author):
    """Create and return a new book-author association."""

    return BookAuthor(book=book, author=author)


def create_book_shelf(book, shelf):
    """Create and return a new book-shelf association."""

    return BookShelf(book=book, shelf=shelf)


def get_book_by_isbn10(isbn10):
    """Return a book by isbn10."""

    return Book.query.filter(Book.primary_isbn10 == isbn10).first()


def get_book_by_isbn13(isbn13):
    """Return a book by isbn13."""
    
    return Book.query.filter(Book.primary_isbn13 == isbn13).first()


if __name__ == '__main__':
    from server import app
    connect_to_db(app)
