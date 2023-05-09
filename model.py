"""Models for movie ratings app."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class User(db.Model):
    """A user."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    email = db.Column(db.String, unique=True, nullable=False)
    password = db.Column(db.String, nullable=False)

    # ratings = db.relationship("Rating", back_populates="user")

    def __repr__(self):
        return f"<User user_id={self.user_id} email={self.email} password={self.password}>"


class Book(db.Model):
    """A book."""

    __tablename__ = "books"

    book_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    title = db.Column(db.String, nullable=False)
    overview = db.Column(db.Text, nullable=True)

    # ratings = db.relationship("Rating", back_populates="movie")

    def __repr__(self):
        return f"<Book book_id={self.book_id} title={self.title}>"
    
class Author(db.Model):
    """An author."""

    __tablename__ = "authors"

    author_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    name = db.Column(db.String, unique=True, nullable=False)
    picture_url = db.Column(db.String, nullable=True)
    about = db.Column(db.Text, nullable=True)

    # ratings = db.relationship("Rating", back_populates="user")

    def __repr__(self):
        return f"<User author_id={self.author_id} name={self.name} about={self.about}>"


# class Rating(db.Model):
#     """A movie rating."""

#     __tablename__ = "ratings"

#     rating_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
#     score = db.Column(db.Integer)
#     movie_id = db.Column(db.Integer, db.ForeignKey("movies.movie_id"))
#     user_id = db.Column(db.Integer, db.ForeignKey("users.user_id"))

#     movie = db.relationship("Movie", back_populates="ratings")
#     user = db.relationship("User", back_populates="ratings")

#     def __repr__(self):
#         return f"<Rating rating_id={self.rating_id} score={self.score}>"


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
