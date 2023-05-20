"""Server for movie ratings app."""

from flask import (Flask, render_template, request, flash, session, redirect)
from model import connect_to_db, db
import crud
from jinja2 import StrictUndefined
from random import sample

app = Flask(__name__)
app.app_context().push()
app.secret_key = "book_app_secret_key"
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
    category = request.args.get("category", "")
    list_id = request.args.get("list", "")

    if list_id != "":
        books = crud.get_books_by_list(list_id)
        header = f"Best Sellers List: {crud.get_list_by_id(list_id).list_name}"
    elif author != "":
        books = crud.get_books_by_author_name(author)
        header = f"results for \'{author}\' in book's authors"
    elif title != "":
        books = crud.get_books_by_title(title)
        header = f"results for \'{title}\' in book's title"
    elif category != "":
        books = crud.get_books_by_category(category)
        header = f"results for \'{category}\' in book's categories"
    else:
        books = []
        header = ""

        # print("!!!!!!!!!!!!!!!!!!!!!!!")
        # if len(books) > 3:
        #   print(sample(books, 3))

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


@app.route("/login")
def login_form():
    """Show user login form."""

    return render_template("login_form.html")


@app.route("/login", methods=["POST"])
def process_login():
    """Process user login."""

    email = request.form.get("email")
    password = request.form.get("password")

    user = crud.get_user_by_email(email)
    if not user or user.password != password:
        flash("The email or password you entered was incorrect.")
        return redirect("/login")
    else:
        # Log in user by storing the user's email in session
        session["user_email"] = user.email
        flash(f"Welcome, {user.user_name}!")

    return redirect("/")


@app.route("/register")
def register_form():
    """Show user register form."""

    return render_template("register_form.html")


@app.route("/register", methods=["POST"])
def register_user():
    """Register/Create a new user."""

    email = request.form.get("email")
    name = request.form.get("name")
    password = request.form.get("password")

    user = crud.get_user_by_email(email)
    if user:
        flash("Cannot create an account with that email. Try again.")
    else:
        user = crud.create_user(name, email, password)
        db.session.add(user)
        db.session.commit()

        # For every user create three bookshelves
        shelf = crud.create_shelf(user.user_id, "To Read")
        db.session.add(shelf)
        shelf = crud.create_shelf(user.user_id, "Already Read")
        db.session.add(shelf)
        shelf = crud.create_shelf(user.user_id, "Favorites")
        db.session.add(shelf)
        db.session.commit()
        flash("Account created! Please log in.")

    return redirect("/login")


@app.route("/logout")
def process_logout():
    """Process user logout."""

    session.pop("user_email", None)

    flash(f"Goodbye!")

    return redirect("/")


@app.route("/bookshelf")
def show_user_bookshelf():
    """Show user bookshelf"""

    email = session.get('user_email')
    user = crud.get_user_by_email(email)
    to_read_books = crud.get_users_books(user=user, shelf_type="To Read")
    already_read_books = crud.get_users_books(
        user=user, shelf_type="Already Read")
    favorite_books = crud.get_users_books(user=user, shelf_type="Favorites")

    return render_template(
        "bookshelf.html",
        to_read_books=to_read_books,
        already_read_books=already_read_books,
        favorite_books=favorite_books)


if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
