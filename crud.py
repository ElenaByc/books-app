"""CRUD operations."""

from model import (User, Book, Shelf, Author, Category, List, Cover,
                   BookCategory, BookList, BookAuthor, BookShelf,
                   db, connect_to_db)


def create_user(name, email, password):
    """Create and return a new user."""

    return User(user_name=name, email=email, password=password)


def create_book(title, isbn10, isbn13, description="", contributor_note=""):
    """Create and return a new book."""

    return Book(title=title, primary_isbn10=isbn10, primary_isbn13=isbn13, description=description, contributor_note=contributor_note)


def create_category(category_name):
    """Create and return a new category."""

    return Category(category_name=category_name)


def create_list(list_name, nyt_list_name_encoded):
    """Create and return a new list."""

    return List(list_name=list_name, nyt_list_name_encoded=nyt_list_name_encoded)


def create_author(name, ol_id=None, about=None, picture=None):
    """Create and return a new author."""

    return Author(name=name, author_ol_id=ol_id, about=about, picture_url=picture)


def create_shelf(user_id, shelf_type):
    """Create and return a new shelf."""

    return Shelf(user_id=user_id, shelf_type=shelf_type)


def create_cover(book_id, cover_url, source):
    """Create and return a new book cover."""

    return Cover(book_id=book_id, cover_url=cover_url, source=source)


def create_book_category(book_id, category_id):
    """Create and return a new book-category association."""

    return BookCategory(book_id=book_id, category_id=category_id)


def create_book_list(book_id, list_id):
    """Create and return a new book-list association."""

    return BookList(book_id=book_id, list_id=list_id)


def create_book_author(book_id, author_id):
    """Create and return a new book-author association."""

    return BookAuthor(book_id=book_id, author_id=author_id)


def create_book_shelf(book, shelf):
    """Create and return a new book-shelf association."""

    return BookShelf(book=book, shelf=shelf)


# Getting books


def get_book_by_isbn10(isbn10):
    """Return a book by isbn10."""

    return Book.query.filter(Book.primary_isbn10 == isbn10).first()


def get_book_by_isbn13(isbn13):
    """Return a book by isbn13."""

    return Book.query.filter(Book.primary_isbn13 == isbn13).first()


def get_books_by_list(list_id):
    """Return all books in list."""

    result = []
    book_list_list = BookList.query.filter(
        BookList.list_id == list_id).all()
    for bc in book_list_list:
        result.append(get_book_by_id(bc.book_id))

    return result


def get_books_by_title(search_phrase):
    """Return all books that have search_phrase in their titles"""

    return Book.query.filter(Book.title.ilike(f"%{search_phrase}%")).all()


def get_books_by_author_name(author_name):
    """Return all books that have author_name in their authors."""

    result = []
    authors = get_authors_by_name(author_name)
    for author in authors:
        result.extend(author.books)
    return list(set(result))


def get_books_by_category(search_phrase):
    """Return all books that have search_phrase in their categories."""

    result = []
    categories = get_categories_by_name(search_phrase)
    for category in categories:
        result.extend(category.books)
    return list(set(result))


def get_all_books():
    """Return all books."""

    return db.session.query(Book).order_by("book_id").all()


def get_book_by_id(book_id):
    """Return a book by primary key."""

    return Book.query.get(book_id)


def get_books_by_shelf_id(shelf_id):
    """Return books by shelf_id."""

    return get_shelf_by_id(shelf_id).books


def get_users_books(user, shelf_type):
    """Return books by user and shelf_type."""

    shelves = user.shelves
    for shelf in shelves:
        if shelf.shelf_type == shelf_type:
            shelf_id = shelf.shelf_id
            return get_books_by_shelf_id(shelf_id)

    return None


# Getting shelves

def get_shelf_by_id(shelf_id):
    """Return a shelf by primary key."""

    return Shelf.query.get(shelf_id)


#  Getting lists

def get_all_lists():
    """Return all lists."""

    return List.query.all()


def get_list_by_id(list_id):
    """Return a list by primary key."""

    return List.query.get(list_id)


#  Getting authors

def get_author_by_id(author_id):
    """Return a author by primary key."""

    return Author.query.get(author_id)


def get_author_by_ol_id(ol_id):
    """Return an author by Open Library Id"""

    return Author.query.filter(Author.author_ol_id == ol_id).first()


def get_authors_by_name(author_name):
    """Return list of authors by author_name"""

    return Author.query.filter(Author.name.ilike(f"%{author_name}%")).all()


#  Getting categories


def get_category_by_name(category_name):
    """Return a category by its name."""

    return Category.query.filter(Category.category_name == category_name).first()


def get_categories_by_name(search_phrase):
    """Return categories with search_phrase in theri names"""

    return Category.query.filter(Category.category_name.ilike(f"%{search_phrase}%")).all()


def get_book_category(book_id, category_id):
    """Return a book_category by book_id and category_id."""

    return BookCategory.query.filter(
        BookCategory.book_id == book_id,
        BookCategory.category_id == category_id).first()


# Getting users


def get_user_by_email(email):
    """Return a user by email."""

    return User.query.filter(User.email == email).first()


if __name__ == '__main__':
    from server import app
    connect_to_db(app)
