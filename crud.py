"""CRUD operations."""

from model import (User, Book, Shelf, Author, Subject, Category, Cover,
                   BookSubject, BookCategory, BookAuthor, BookShelf,
                   db, connect_to_db)


def create_user(email, password):
    """Create and return a new user."""

    return User(email=email, password=password)


def create_book(title, isbn10, isbn13, overview=""):
    """Create and return a new book."""

    return Book(title=title, primary_isbn10=isbn10, primary_isbn13=isbn13, overview=overview)


def create_subject(subject):
    """Create and return a new subject."""

    return Subject(subject=subject)


def create_category(category, nyt_list_name):
    """Create and return a new category."""

    return Category(category=category, nyt_list_name_encoded=nyt_list_name)


def create_author(ol_id, name, about, picture):
    """Create and return a new author."""

    return Author(author_ol_id=ol_id, name=name, about=about, picture_url=picture)


def create_shelf(name, about, picture):
    """Create and return a new shelf."""

    return Shelf(name=name, about=about, picture_url=picture)


def create_cover(book_id, cover_url, source):
    """Create and return a new book cover."""

    return Cover(book_id=book_id, cover_url=cover_url, source=source)


def create_book_subject(book, subject):
    """Create and return a new book-subject association."""

    return BookSubject(book=book, subject=subject)


def create_book_category(book_id, category_id):
    """Create and return a new book-category association."""

    return BookCategory(book_id=book_id, category_id=category_id)


def create_book_author(book_id, author_id):
    """Create and return a new book-author association."""

    return BookAuthor(book_id=book_id, author_id=author_id)


def create_book_shelf(book, shelf):
    """Create and return a new book-shelf association."""

    return BookShelf(book=book, shelf=shelf)


def get_book_by_isbn10(isbn10):
    """Return a book by isbn10."""

    return Book.query.filter(Book.primary_isbn10 == isbn10).first()


def get_book_by_isbn13(isbn13):
    """Return a book by isbn13."""

    return Book.query.filter(Book.primary_isbn13 == isbn13).first()


def get_books_by_category(category_id):
    """Return all book by category."""

    # return Book.query.filter(Book.categories.contains(get_category_by_id)).all()

    result = []
    book_category_list = BookCategory.query.filter(
        BookCategory.category_id == category_id).all()
    for bc in book_category_list:
        result.append(get_book_by_id(bc.book_id))

    return result


def get_all_books():
    """Return all books."""

    return Book.query.all()


def get_book_by_id(book_id):
    """Return a book by primary key."""

    return Book.query.get(book_id)


def get_all_categories():
    """Return all categories."""

    return Category.query.all()


def get_category_by_id(category_id):
    """Return a category by primary key."""

    return Category.query.get(category_id)


def get_author_by_id(author_id):
    """Return a author by primary key."""

    return Author.query.get(author_id)


def get_author_by_ol_id(ol_id):
    """Return an author by Open Library Id"""

    return Author.query.filter(Author.author_ol_id == ol_id).first()


if __name__ == '__main__':
    from server import app
    connect_to_db(app)
