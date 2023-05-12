"""Server for movie ratings app."""

from flask import (Flask, render_template, request, flash, session, redirect)
from model import connect_to_db, db
import crud
from jinja2 import StrictUndefined

app = Flask(__name__)
app.app_context().push()
app.secret_key = "dev"
app.jinja_env.undefined = StrictUndefined


@app.route('/')
def homepage():
    """View homepage."""

    return render_template('homepage.html')


@app.route("/categories")
def all_categories():
    """View all book categories."""

    categories = crud.get_all_categories()

    return render_template("all_categories.html", categories=categories)


@app.route("/books")
def all_books():
    """View all books."""

    books = crud.get_all_books()

    return render_template("all_books.html", books=books)


@app.route("/books/<book_id>")
def show_movie(book_id):
    """Show details on a particular book."""

    book = crud.get_book_by_id(book_id)

    return render_template("book_details.html", book=book)


if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
