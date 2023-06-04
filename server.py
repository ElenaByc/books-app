"""Server for movie ratings app."""

from flask import (Flask, render_template, request,
                   flash, session, redirect, jsonify)
from model import connect_to_db, db
from utilites import (create_user_preferences_dict,
                      get_recommendations,
                      sqlalchemy_book_obj_to_dict,
                      sqlalchemy_list_obj_to_dict,
                      get_book_walmart_link_by_isbn13)
import crud
from jinja2 import StrictUndefined
from random import sample
from passlib.hash import pbkdf2_sha256

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
def search_books():
    """Search for books in the database"""

    options = request.args.get("options", "")
    checkmark = request.args.get("bookshelf")

    if options == "author":
        author = request.args.get("author")
        books = crud.get_books_by_author_name(author)
        header = f"Results for \'{author}\' in book's authors"
    elif options == "title":
        title = request.args.get("title")
        books = crud.get_books_by_title(title)
        header = f"Results for \'{title}\' in book's title"
    elif options == "category":
        category = request.args.get("category")
        books = crud.get_books_by_category(category)
        header = f"Results for \'{category}\' in book's categories"
    elif options == "list":
        list_id = request.args.get("list")
        books = crud.get_books_by_list(list_id)
        header = f"Best Sellers List: {crud.get_list_by_id(list_id).list_name}"
    elif options == "favorites":
        # analize user's Favorites

        # get user and then user's favorite books
        logged_in_email = session.get("user_email")
        user = crud.get_user_by_email(logged_in_email)
        shelf_type = "Favorites"
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
        if len(shelf.books) == 0:
            books = []
            header = "Sorry, we cannot give you recommendations based on your favorites since your Favorites bookshelf is empty"
        else:
            fav_dict = create_user_preferences_dict(shelf.books)

            # get all book and for each book give raiting based on the dictionary
            # return TEN(?) best results
            # most likelly, the result will include all the books from the user's Favorites
            all_books = crud.get_all_books()
            books = get_recommendations(
                all_books, fav_dict, 10 + len(shelf.books))
            header = f"Books recommendations based on your Favorites bookshelf"
    else:
        books = []
        header = ""

    if len(books) != 0 and checkmark == "on":
        # remove books that on users bookshelf
        logged_in_email = session.get("user_email")
        if logged_in_email:
            user = crud.get_user_by_email(logged_in_email)
            shelf_books = crud.get_books_by_user(user)
            books_new = []
            for book in books:
                if not book in shelf_books:
                    books_new.append(book)
            books = books_new

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


@app.route("/api/logged-in")
def is_user_logged_in():
    """Determines whether the current visitor is a logged in user."""

    email = session.get("user_email")
    if email:
        is_logged_in = True
    else:
        is_logged_in = False

    return jsonify(is_logged_in)


@app.route("/api/lists")
def api_lists():
    """Return parsed json containing all The New York Times Best Sellers lists."""

    lists = crud.get_all_lists()

    # convert SQLAlchemy list obects to dictionaries
    lists_data = []
    for l in lists:
        list_dict = sqlalchemy_list_obj_to_dict(l)
        lists_data.append(list_dict)

    return jsonify({"lists": lists_data})


@app.route("/api/books")
def api_books():
    """Return parsed json containing all books from search results"""

    option = request.args.get("option", "")
    checkmark = request.args.get("checkmark")

    print("SEARCHING!!!!!!!!!!!!!!!!!!!")
    print("option ", option)
    print("checkmark ", checkmark)

    if option == "author":
        author = request.args.get("author")
        books = crud.get_books_by_author_name(author)
        header = f"Results for \'{author}\' in book's authors"
    elif option == "title":
        title = request.args.get("title")
        books = crud.get_books_by_title(title)
        header = f"Results for \'{title}\' in book's title"
    elif option == "category":
        category = request.args.get("category")
        books = crud.get_books_by_category(category)
        print("SEARCHING!!!!!!!!!!!!!!!!!!!")
        print("category ", category)
        print("books len: ", len(books))
        header = f"Results for \'{category}\' in book's categories"
    elif option == "list":
        list_id = request.args.get("list")
        books = crud.get_books_by_list(list_id)
        header = f"Best Sellers List: {crud.get_list_by_id(list_id).list_name}"
    elif option == "favorites":
        # analize user's Favorites

        # get user and then user's favorite books
        logged_in_email = session.get("user_email")
        user = crud.get_user_by_email(logged_in_email)
        shelf_type = "Favorites"
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
        if len(shelf.books) == 0:
            books = []
            header = "Sorry, we cannot give you recommendations based on your favorites since your Favorites bookshelf is empty"
        else:
            fav_dict = create_user_preferences_dict(shelf.books)

            # get all book and for each book give raiting based on the dictionary
            # return TEN(?) best results
            # most likelly, the result will include all the books from the user's Favorites
            all_books = crud.get_all_books()
            books = get_recommendations(
                all_books, fav_dict, 10 + len(shelf.books))
            header = f"Books recommendations based on your Favorites bookshelf"
    else:
        books = []
        header = "Sorry, no books matching your request. Please try different search parameters."

    if len(books) != 0 and checkmark == "true":
        # remove books that on users bookshelf
        logged_in_email = session.get("user_email")
        if logged_in_email:
            user = crud.get_user_by_email(logged_in_email)
            shelf_books = crud.get_books_by_user(user)
            books_new = []
            for book in books:
                if not book in shelf_books:
                    books_new.append(book)
            books = books_new

    if books == None or len(books) == 0:
        return jsonify({"status": "NO DATA", "header": header, "books": []})

    print("books len: ", len(books))
    # convert SQLAlchemy book obects to dictionaries
    books_data = []
    for book in books:
        book_dict = sqlalchemy_book_obj_to_dict(book)
        books_data.append(book_dict)

    return jsonify({"status": "OK", "header": header, "books": books_data})


@app.route("/api/bookshelf")
def api_bookshelf():
    """Return parsed json containing all books on the user's shelf """

    # get user
    email = session.get("user_email")
    user = crud.get_user_by_email(email)

    # get bookshelf type
    shelf_type = request.args.get("shelf")
    if shelf_type == "read":
        shelf_type = "To Read"
    elif shelf_type == "already":
        shelf_type = "Already Read"
    else:
        shelf_type = "Favorites"

    # get book on the user shelf
    books = crud.get_users_books(user=user, shelf_type=shelf_type)

    # update Walmart links
    for book in books:
        if book.walmart_link is None:
            book.walmart_link = get_book_walmart_link_by_isbn13(
                book.primary_isbn13)
            print("!LINK "*10)
            print(book.walmart_link)
            if book.walmart_link:
                db.session.commit()

    if books == None or len(books) == 0:
        return jsonify({"status": "NO DATA", "books": []})

    # convert SQLAlchemy book obects to dictionaries
    books_data = []
    for book in books:
        book_dict = sqlalchemy_book_obj_to_dict(book)
        books_data.append(book_dict)

    return jsonify({"status": "OK", "books": books_data})


@app.route("/to-read", methods=["POST"])
def add_to_read():
    """Put a book on a user's To Read Bookshelf, create new book_to_shelf association."""

    logged_in_email = session.get("user_email")
    book_id = request.get_json().get("book_id")

    if logged_in_email is None:
        msg = "You must log in to add a book to your bookshelf"
        success = False
        shelf_type = ""
    else:
        # get user
        user = crud.get_user_by_email(logged_in_email)
        # get To read shelf
        shelf_type = "To Read"
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
        # check if the book is already on user's To Read Bookshelf
        book_shelf = crud.get_book_shelf(book_id, shelf.shelf_id)
        if book_shelf:
            msg = "You already have this book on your bookshelf"
            success = False
        else:
            # create book to shelf association
            book_shelf = crud.create_book_shelf(book_id, shelf.shelf_id)
            db.session.add(book_shelf)
            db.session.commit()
            msg = "You successfully put this book on your bookshelf"
            success = True
    return jsonify({"success": success, "message": msg, "shelf": shelf_type})


@app.route("/to-already-read", methods=["POST"])
def add_to_already_read():
    """Put a book on a user Already Read Bookshelf, create new book_to_shelf association."""

    logged_in_email = session.get("user_email")
    book_id = request.get_json().get("book_id")

    if logged_in_email is None:
        msg = "You must log in to add a book to your bookshelf"
        success = False
        shelf_type = ""
    else:
        # get user
        user = crud.get_user_by_email(logged_in_email)
        # get Already Read and To Read shelves
        shelf_from = crud.get_shelf_by_user(user.user_id, "To Read")
        shelf_to = crud.get_shelf_by_user(user.user_id, "Already Read")

        # check if the book is already on user's Already Read Bookshelf
        book_shelf = crud.get_book_shelf(book_id, shelf_to.shelf_id)
        if book_shelf:
            msg = "You already have this book on your bookshelf"
            success = False
            shelf_type = "Already Read"
        else:
            # get book to shelf association / record
            db_book_shelf = crud.get_book_shelf(book_id, shelf_from.shelf_id)
            # update = change shelf_id
            db_book_shelf.shelf_id = shelf_to.shelf_id
            db.session.commit()
            msg = "You successfully put this book on your bookshelf"
            success = True
            shelf_type = "Already Read"
    return jsonify({"success": success, "message": msg, "shelf": shelf_type})


@app.route("/to-favorites", methods=["POST"])
def add_to_favorites():
    """Mark a book on a user Already Read Bookshelf as their Favorite."""

    logged_in_email = session.get("user_email")
    book_id = request.get_json().get("book_id")

    if logged_in_email is None:
        msg = "You must log in to add a book to your bookshelf"
        success = False
        shelf_type = ""
    else:
        # get user
        user = crud.get_user_by_email(logged_in_email)
        # get Favorites shelf
        shelf_type = "Favorites"
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)

        # check if the book is already on user's Favorites Bookshelf
        book_shelf = crud.get_book_shelf(book_id, shelf.shelf_id)
        if book_shelf:
            msg = "You already have this book on your bookshelf"
            success = False
        else:
            # create book to shelf association
            book_shelf = crud.create_book_shelf(book_id, shelf.shelf_id)
            db.session.add(book_shelf)
            db.session.commit()
            msg = "You successfully put this book on your bookshelf"
            success = True
    return jsonify({"success": success, "message": msg, "shelf": shelf_type})


@app.route("/remove", methods=["POST"])
def remove_book_from_shelf():
    """Remove a book from a shelf"""

    logged_in_email = session.get("user_email")
    book_id = request.get_json().get("book_id")
    shelf_type = request.get_json().get("shelf")

    if logged_in_email is None:
        success = False
        msg = "You must log in to remove a book from your bookshelf"
        shelf_type = ""
    else:
        # get user
        user = crud.get_user_by_email(logged_in_email)
        # get user's shelf of shelf_type
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
        # check if this book-to-shelf association exists in the db
        db_book_shelf = crud.get_book_shelf(book_id, shelf.shelf_id)
        if db_book_shelf:
            # the book on user's bookshelf
            # remove this record from db
            db.session.delete(db_book_shelf)
            db.session.commit()
            success = True
            msg = "The book was successfully removed from your bookshelf"
        else:
            success = False
            msg = "There is no such book on your bookshelf"

    return jsonify({"success": success, "message": msg, "shelf": shelf_type})


@app.route("/books/<book_id>")
def show_book(book_id):
    """Show details on a particular book."""

    book = crud.get_book_by_id(book_id)
    display_message = False
    shelf_type = ""

    logged_in_email = session.get("user_email")
    if logged_in_email:
        user = crud.get_user_by_email(logged_in_email)
        shelf_type = "To Read"
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
        if crud.get_book_shelf(book_id, shelf.shelf_id):
            display_message = True
        else:
            shelf_type = "Already Read"
            shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
            if crud.get_book_shelf(book_id, shelf.shelf_id):
                display_message = True

    return render_template(
        "book_details.html",
        book=book,
        display_message=display_message,
        shelf_type=shelf_type)


@app.route("/books/<book_id>/bookshelf", methods=["POST"])
def put_book_on_shelf(book_id):
    """Create book_to_shelf association."""

    logged_in_email = session.get("user_email")
    shelf_type = request.form.get("shelf")

    if logged_in_email is None:
        flash("ERROR|You must log in to add a book to your bookshelf")
    else:
        user = crud.get_user_by_email(logged_in_email)
        if shelf_type == "read":
            shelf_type = "To Read"
        elif shelf_type == "already":
            shelf_type = "Already Read"
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
        book_shelf = crud.create_book_shelf(book_id, shelf.shelf_id)
        db.session.add(book_shelf)
        db.session.commit()

        flash(
            f"OK|You put this book on your <span class=\"shelf-type\">{shelf_type}</span> bookshelf")

    return redirect(f"/books/{book_id}")


@app.route("/remove/<book_id>")
def remove_book(book_id):
    """Remove a book from user's bookshelf."""

    shelf_type = ""

    logged_in_email = session.get("user_email")
    user = crud.get_user_by_email(logged_in_email)
    shelf_type = "To Read"
    shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
    db_book_shelf = crud.get_book_shelf(book_id, shelf.shelf_id)
    if db_book_shelf:
        # the book on user's To read bookshelf
        # remove this record from db
        db.session.delete(db_book_shelf)
        db.session.commit()
        flash("OK|The book was removed from your <span class=\"shelf-type\">To Read</span> bookshelf")
    else:
        shelf_type = "Already Read"
        shelf = crud.get_shelf_by_user(user.user_id, shelf_type)
        db_book_shelf = crud.get_book_shelf(book_id, shelf.shelf_id)
        if db_book_shelf:
            # the book on user's To read bookshelf
            # remove this record from db
            db.session.delete(db_book_shelf)
            db.session.commit()
            flash(
                "OK|The book was removed from your <span class=\"shelf-type\">Already Read</span> bookshelf")

    return redirect("/bookshelf")


@app.route("/read/<book_id>")
def move_book(book_id):
    """Move a book from user's To Read bookshelf to Already read bookshelf."""

    logged_in_email = session.get("user_email")
    user = crud.get_user_by_email(logged_in_email)
    shelf_from = crud.get_shelf_by_user(user.user_id, "To Read")
    shelf_to = crud.get_shelf_by_user(user.user_id, "Already Read")
    db_book_shelf = crud.get_book_shelf(book_id, shelf_from.shelf_id)
    db_book_shelf.shelf_id = shelf_to.shelf_id
    db.session.commit()
    flash("OK|The book was moved to your <span class=\"shelf-type\">Already Read</span> bookshelf")

    return redirect("/bookshelf")


@app.route("/favorite/<book_id>")
def create_favorite(book_id):
    """Mark a book from user's Already Read bookshelf to Favorites bookshelf."""

    logged_in_email = session.get("user_email")

    user = crud.get_user_by_email(logged_in_email)
    shelf = crud.get_shelf_by_user(user.user_id, "Favorites")
    book_shelf = crud.create_book_shelf(book_id, shelf.shelf_id)
    db.session.add(book_shelf)
    db.session.commit()

    flash(
        f"OK|You put this book on your <span class=\"shelf-type\">Favorites</span> bookshelf")

    return redirect("/bookshelf")


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
    # correct = pbkdf2_sha256.verify(password, user.password)
    # hash = pbkdf2_sha256.encrypt(password, rounds=200000, salt_size=16)
    # print("CORRECT " * 5)
    # print(correct)
    # print("password ", user.password)
    # print("hash ", hash)
    # print("CORRECT " * 5)
    # if not user or user.password != password:
    if not user or not pbkdf2_sha256.verify(password, user.password):
        flash("ERROR|The email or password you entered was incorrect.")
        return redirect("/login")
    else:
        # Log in user by storing the user's email in session
        session["user_email"] = user.email
        session["user_name"] = user.user_name
        flash(f"OK|You logged in as {user.user_name}")

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
    hash = pbkdf2_sha256.encrypt(password, rounds=200000, salt_size=16)

    user = crud.get_user_by_email(email)
    if user:
        flash("ERROR|Cannot create an account with that email. <br> Please try again with another email address.")
    else:
        user = crud.create_user(name, email, hash)
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
        flash("OK|Account created! Please log in.")

    return redirect("/login")


@app.route("/logout")
def process_logout():
    """Process user logout."""

    session.pop("user_email", None)
    session.pop("user_name", None)

    flash(f"OK| You're now logged out<br> We look forward to serving your again soon!")

    return redirect("/")


@app.route("/bookshelf")
def show_user_bookshelf_react():
    """Show user bookshelf"""

    return render_template("bookshelf-react.html")


@app.route("/bookshelf-old")
def show_user_bookshelf():
    """Show user bookshelf"""

    email = session.get("user_email")
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


# @app.route("/test-redirect")
# def test_redirect():
#     return redirect(url_for('.search_books', options={}, checkmark=False))


if __name__ == "__main__":
    connect_to_db(app)
    app.run(host="0.0.0.0", debug=True)
