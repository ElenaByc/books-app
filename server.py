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

    lists = crud.get_all_lists()

    return render_template("homepage.html", lists=lists)


@app.route("/search-result")
def show_searching_result():
    """Show event search form"""

    author = request.args.get("author", "")
    title = request.args.get("title", "")
    subject = request.args.get("subject", "")
    list_id = request.args.get("list", "")

    if list_id != "":
        books = crud.get_books_by_list(list_id)
        header = f"Best Sellers List: {crud.get_list_by_id(list_id).list_name}"
        # print("!!!!!!!!!!!!!!!!!!!!!!!")
        # print(sample(books, 3))
    elif author != "":
        books = crud.get_books_by_author_name(author)
        header = f"results for \'{author}\' in book's authors"
    elif title != "":
        books = crud.get_books_by_title(title)
        header = f"results for \'{title}\' in book's title"
    else:
        books = []
        header = ""

    return render_template("all_books.html", books=books, header=header)


@app.route("/lists")
def all_lists():
    """View all The New York Times Best Sellers lists"""

    lists = crud.get_all_lists()

    return render_template("all_lists.html", lists=lists)


@app.route("/books")
def all_books():
    """View all books."""

    books = crud.get_all_books()

    return render_template("all_books.html", books=books, header='')


@app.route("/books/<book_id>")
def show_book(book_id):
    """Show details on a particular book."""

    book = crud.get_book_by_id(book_id)

    return render_template("book_details.html", book=book)


if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
