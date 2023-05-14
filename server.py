"""Server for movie ratings app."""

from flask import (Flask, render_template, request, flash, session, redirect)
from model import connect_to_db, db
import crud
from jinja2 import StrictUndefined
from random import sample

app = Flask(__name__)
app.app_context().push()
app.secret_key = "dev"
app.jinja_env.undefined = StrictUndefined


@app.route('/')
def homepage():
    """View homepage."""

    categories = crud.get_all_categories()

    return render_template('homepage.html', categories=categories)


@app.route('/search-result')
def show_searching_result():
    """Show event search form"""

    author = request.args.get('author', '')
    title = request.args.get('title', '')
    subject = request.args.get('subject', '')
    category_id = request.args.get('category', '')

    if category_id != '':
        books = crud.get_books_by_category(category_id)
        category = crud.get_category_by_id(category_id).category
        print("!!!!!!!!!!!!!!!!!!!!!!!")
        print(sample(books, 3))
    else:
        books = []
        category = ''

    return render_template("all_books.html", books=books, category=category)


@app.route("/categories")
def all_categories():
    """View all book categories."""

    categories = crud.get_all_categories()

    return render_template("all_categories.html", categories=categories)


@app.route("/books")
def all_books():
    """View all books."""

    books = crud.get_all_books()

    return render_template("all_books.html", books=books, category='')


@app.route("/books/<book_id>")
def show_book(book_id):
    """Show details on a particular book."""

    book = crud.get_book_by_id(book_id)

    return render_template("book_details.html", book=book)


@app.route("/authors/<author_id>")
def show_author(author_id):
    """Show details on a particular author."""

    author = crud.get_author_by_id(author_id)

    return render_template("author_details.html", author=author)


if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
