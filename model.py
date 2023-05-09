"""Models for books app."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


# Main tables


class User(db.Model):
    """A user."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
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
    overview = db.Column(db.Text, nullable=True)

    authors = db.relationship(
        "Author", secondary="books_authors", back_populates="books")
    genres = db.relationship(
        "Genre", secondary="books_genres", back_populates="books")
    shelves = db.relationship(
        "Shelf", secondary="books_shelves", back_populates="books")

    def __repr__(self):
        return f"<Book book_id={self.book_id} title={self.title}>"


class Author(db.Model):
    """An author."""

    __tablename__ = "authors"

    author_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String, unique=True, nullable=False)
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


class Genre(db.Model):
    """Genre of book."""

    __tablename__ = "genres"

    genre_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    genre = db.Column(db.String(50), unique=True)
    # fiction = db.Column(db.Boolean, nullable=False)
    description = db.Column(db.Text, nullable=True)

    books = db.relationship(
        "Book", secondary="books_genres", back_populates="genres")

    def __repr__(self):
        return f"<Genre genre_id={self.genre_id} genre={self.genre} description={self.description}>"


class Cover(db.Model):
    """A bookcover."""

    __tablename__ = "covers"

    cover_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey(
        "books.book_id"), nullable=False)
    cover_url = db.Column(db.String, nullable=False)

    book = db.relationship(
        "Book", back_populates="covers")

    def __repr__(self):
        return f"<Cover cover_id={self.cover_id} book_id={self.book_id} cover_url={self.cover_url}>"


# Associations tables


class BookGenre(db.Model):
    """Genre of a specific book."""

    __tablename__ = "books_genres"

    book_genre_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey(
        "books.book_id"), nullable=False)
    genre_id = db.Column(db.Integer, db.ForeignKey(
        "genres.genre_id"), nullable=False)


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
