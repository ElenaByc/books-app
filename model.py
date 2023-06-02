"""Models for books app."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


# Main tables


class User(db.Model):
    """A user."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, unique=True, nullable=False)
    password = db.Column(db.String, nullable=False)

    shelves = db.relationship("Shelf", back_populates="user")

    def __repr__(self):
        return f"<User user_id={self.user_id} email={self.email} password={self.password}>"


class Book(db.Model):
    """A book."""

    __tablename__ = "books"

    book_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String, nullable=False)
    primary_isbn10 = db.Column(db.String(20), nullable=True)
    primary_isbn13 = db.Column(db.String(20), unique=True, nullable=False)
    description = db.Column(db.Text, nullable=True)
    contributor_note = db.Column(db.String(100), nullable=True)
    walmart_link = db.Column(db.String, nullable=True)

    authors = db.relationship(
        "Author", secondary="books_authors", back_populates="books")
    categories = db.relationship(
        "Category", secondary="books_categories", back_populates="books")
    lists = db.relationship(
        "List", secondary="books_lists", back_populates="books")
    shelves = db.relationship(
        "Shelf", secondary="books_shelves", back_populates="books")
    covers = db.relationship("Cover", back_populates="book")

    def __repr__(self):
        return f"<Book book_id={self.book_id} title={self.title} isbn10={self.primary_isbn10} isbn13={self.primary_isbn13}>"


class Author(db.Model):
    """An author."""

    __tablename__ = "authors"

    author_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    author_ol_id = db.Column(db.String, unique=True, nullable=True)
    name = db.Column(db.String, nullable=False)
    picture_url = db.Column(db.String, nullable=True)
    about = db.Column(db.Text, nullable=True)

    books = db.relationship(
        "Book", secondary="books_authors", back_populates="authors")

    def __repr__(self):
        return f"<Author author_id={self.author_id} name={self.name} about={self.about}>"


class Shelf(db.Model):
    """A bookshelf."""

    __tablename__ = "shelves"

    shelf_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey(
        "users.user_id"), nullable=False)
    shelf_type = db.Column(db.String, nullable=False)

    user = db.relationship("User", back_populates="shelves")
    books = db.relationship(
        "Book", secondary="books_shelves", back_populates="shelves")

    def __repr__(self):
        return f"<Shelf shelf_id={self.shelf_id} user_id={self.user_id} shelf_type={self.shelf_type}>"


class Category(db.Model):
    """Category of book."""

    __tablename__ = "categories"

    category_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    category_name = db.Column(db.String(100), unique=True, nullable=False)

    books = db.relationship(
        "Book", secondary="books_categories", back_populates="categories")

    def __repr__(self):
        return f"<Category category_id={self.category_id} category={self.category_name} >"


class List(db.Model):
    """New The New York Times Best Sellers List of book."""

    __tablename__ = "lists"

    list_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    list_name = db.Column(db.String(100), unique=True, nullable=False)
    nyt_list_name_encoded = db.Column(db.String(100), nullable=False)

    books = db.relationship(
        "Book", secondary="books_lists", back_populates="lists")

    def __repr__(self):
        return f"<List list_id={self.list_id} list_name={self.list_name} nyt_list_name={self.nyt_list_name_encoded}>"


class Cover(db.Model):
    """A bookcover."""

    __tablename__ = "covers"

    cover_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey(
        "books.book_id"), nullable=False)
    cover_url = db.Column(db.String, nullable=False)
    source = db.Column(db.String(10), nullable=False)

    book = db.relationship(
        "Book", back_populates="covers")

    def __repr__(self):
        return f"<Cover cover_id={self.cover_id} book_id={self.book_id} source={self.source} cover_url={self.cover_url}>"


# Associations tables

class BookCategory(db.Model):
    """Category of a specific book."""

    __tablename__ = "books_categories"

    book_category_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey(
        "books.book_id"), nullable=False)
    category_id = db.Column(db.Integer, db.ForeignKey(
        "categories.category_id"), nullable=False)

    def __repr__(self):
        return f"<BookCategory id={self.book_category_id} book_id={self.book_id} category_id={self.category_id}>"


class BookList(db.Model):
    """List of a specific book."""

    __tablename__ = "books_lists"

    book_list_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey(
        "books.book_id"), nullable=False)
    list_id = db.Column(db.Integer, db.ForeignKey(
        "lists.list_id"), nullable=False)


class BookAuthor(db.Model):
    """Author of a specific book."""

    __tablename__ = "books_authors"

    book_author_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey(
        "books.book_id"), nullable=False)
    author_id = db.Column(db.Integer, db.ForeignKey(
        "authors.author_id"), nullable=False)


class BookShelf(db.Model):
    """Book on a specific shelf."""

    __tablename__ = "books_shelves"

    book_shelf_id = db.Column(
        db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey(
        "books.book_id"), nullable=False)
    shelf_id = db.Column(db.Integer, db.ForeignKey(
        "shelves.shelf_id"), nullable=False)


def connect_to_db(flask_app, db_uri="postgresql:///books", echo=True):
    flask_app.config["SQLALCHEMY_DATABASE_URI"] = db_uri
    flask_app.config["SQLALCHEMY_ECHO"] = echo
    flask_app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

    db.app = flask_app
    db.init_app(flask_app)

    print("Connected to the db!")


if __name__ == "__main__":
    from server import app

    # Call connect_to_db(app, echo=False) if your program output gets
    # too annoying; this will tell SQLAlchemy not to print out every
    # query it executes.

    connect_to_db(app)
