"""Script to seed database."""

import os
import json
import requests
from random import choice, randint
from datetime import datetime
from time import sleep

from utilites import (
    format_uppercase_string,
    split_categories,
    get_categories_for_list)

import crud
import model
import server


NYT_API_KEY = os.environ["NYT_KEY"]
GOOGLE_BOOKS_KEY = os.environ["GOOGLE_BOOKS_KEY3"]


NUM_OF_REQUESTS = 0


def get_book_authors_ol(isbn13, book_id):
    url = f"https://openlibrary.org/isbn/{isbn13}.json"
    res = requests.get(url)
    if (res.status_code != 200):
        # not all book have data at Open Library
        print(
            f"ERROR! NO BOOK DATA FROM OP! book_id = {book_id} isbn13 = {isbn13}")
        return False
    data = res.json()
    # not all books have author's data, for example isbn13 = 9781982185824
    # https://openlibrary.org/isbn/9781982185824.json
    #
    # HARRY POTTER does not have "authors", but here is J. K. Rowling page
    # https://openlibrary.org/authors/OL23919A.json
    # /authors/OL23919A
    if not "authors" in data:
        print(f"ERROR! NO AUTHORS DATA! book_id = {book_id} isbn13 = {isbn13}")
        return False
    authors_keys = data["authors"]
    print(authors_keys)
    for author_key in authors_keys:
        # check if this author is already in db
        author_ol_id = author_key["key"]
        db_author = crud.get_author_by_ol_id(author_ol_id)
        if db_author != None:
            # author is already in db, no need to create new author
            # need only create book to author assotiation
            db_book_author = crud.create_book_author(
                book_id, db_author.author_id)
            model.db.session.add(db_book_author)
            model.db.session.commit()
        else:
            # create author
            # get author's details from Open Library API
            url = f"https://openlibrary.org{author_ol_id}.json"
            res = requests.get(url)
            data = res.json()
            name = data["name"]
            bio = data.get("bio", "")
            if not isinstance(bio, str):
                bio = bio.get("value", "")

            picture_url = "picture_url"  # TODO get author photo
            db_author = crud.create_author(
                author_ol_id, name, bio, picture_url)
            model.db.session.add(db_author)
            model.db.session.commit()
            # create book to author assotiation
            db_book_author = crud.create_book_author(
                book_id, db_author.author_id)
            model.db.session.add(db_book_author)
            model.db.session.commit()
    return True


def add_categories_to_db(categories, book_id):
    for category in categories:
        print("***********************************************")
        print("category: ", category)
        print("***********************************************")
        if category.isupper():
            category = format_uppercase_string(category)
        db_category = crud.get_category_by_name(category)
        print("db_category: ", db_category)
        print("***********************************************")
        if db_category == None:
            # create db_category
            db_category = crud.create_category(category)
            print("CREATING DB CATEGORY - ", category)
            model.db.session.add(db_category)
            model.db.session.commit()
            # create book to category assotiation
            print("CREATE BOOK+CATEGORY, BOOK_ID=", book_id)
            db_book_category = crud.create_book_category(
                book_id, db_category.category_id)
            model.db.session.add(db_book_category)
            model.db.session.commit()
        else:
            # check if this book-category pair already exists in db
            db_book_category = crud.get_book_category(
                book_id, db_category.category_id)
            if db_book_category == None:
                # create book to category assotiation
                print("CREATE BOOK+CATEGORY, BOOK_ID=", book_id)
                db_book_category = crud.create_book_category(
                    book_id, db_category.category_id)
                model.db.session.add(db_book_category)
                model.db.session.commit()
            else:
                print("ATTENTION! ALREADY EXISTS", db_book_category)


def get_book_data_google_books_api(db_book):
    """Get book's authors, description and categories from Google Books API"""

    url = f"https://www.googleapis.com/books/v1/volumes?q=isbn:{db_book.primary_isbn13}"
    payload = {"key": GOOGLE_BOOKS_KEY}
    res = requests.get(url, params=payload)
    global NUM_OF_REQUESTS
    NUM_OF_REQUESTS += 1
    if (res.status_code != 200):
        print(
            f"ERROR! STATUS_CODE != 200! book_id = {db_book.book_id} isbn13 = {db_book.primary_isbn13}")
        return False
    data = res.json()
    if not "items" in data:
        return False
    if len(data["items"]) == 0:
        return False
    if not "volumeInfo" in data["items"][0]:
        return False
    if "selfLink" in data["items"][0]:
        url = data["items"][0]["selfLink"]
        res = requests.get(url)
        NUM_OF_REQUESTS += 1
        data2 = res.json()
        if "description" in data2["volumeInfo"]:
            db_book.description = data2["volumeInfo"]["description"]  # html
            # https://stackoverflow.com/questions/3206344/passing-html-to-template-using-flask-jinja2
            # https://css-tricks.com/snippets/javascript/inject-html-from-a-string-of-html/
            model.db.session.commit()

        # get categories from selflink
        if "categories" in data2["volumeInfo"]:
            print("??????? categories = ", data2["volumeInfo"]["categories"])
            categories = split_categories(data2["volumeInfo"]["categories"])
            print("!!!!!!! categories = ", categories)
            add_categories_to_db(categories, db_book.book_id)

    elif "description" in data["items"][0]["volumeInfo"]:
        # plain text
        db_book.description = data["items"][0]["volumeInfo"]["description"]
        model.db.session.commit()

    # get categories
    if "categories" in data["items"][0]["volumeInfo"]:
        categories = data["items"][0]["volumeInfo"]["categories"]
        add_categories_to_db(categories, db_book.book_id)

    # get authors
    if not "authors" in data["items"][0]["volumeInfo"]:
        return False
    authors = data["items"][0]["volumeInfo"]["authors"]

    # get rid of duplicates
    to_remove = []
    for i in range(len(authors)):
        temp_list = [a for j, a in enumerate(authors) if j != i]
        for a in temp_list:
            if authors[i] in a:
                to_remove.append(i)
    to_remove.reverse()
    for index in to_remove:
        del authors[index]

    for author in authors:
        if author.isupper():
            author = format_uppercase_string(author)
        # create author
        db_author = crud.create_author(
            ol_id=None, name=author, about=None, picture=None)
        model.db.session.add(db_author)
        model.db.session.commit()
        # create book to author assotiation
        db_book_author = crud.create_book_author(
            db_book.book_id, db_author.author_id)
        model.db.session.add(db_book_author)
        model.db.session.commit()
    return True


def get_book_authors_nyt(author_name, book_id):
    db_author = crud.create_author(name=author_name)
    model.db.session.add(db_author)
    model.db.session.commit()
    # create book to author assotiation
    db_book_author = crud.create_book_author(
        book_id, db_author.author_id)
    model.db.session.add(db_book_author)
    model.db.session.commit()


# re-create a database
os.system("dropdb books")
os.system("createdb books")

# Connect to the database and call db.create_all:
model.connect_to_db(server.app)
model.db.create_all()


# get all Best Sellers Lists from New York Times Books API
# and create lists in db
url = "https://api.nytimes.com/svc/books/v3/lists/names.json"
payload = {"api-key": NYT_API_KEY}

res = requests.get(url, params=payload)
data = res.json()
NUM_OF_REQUESTS += 1
total_items = data["num_results"]
if total_items != 0:
    lists = data["results"]
else:
    lists = []

lists_in_db = []

for l in lists:
    # Get the display_name and list_name_encoded
    display_name = l["display_name"]
    list_name_encoded = l["list_name_encoded"]
    # Get newest_published_date and convert it to a datetime object
    newest_published_date = datetime.strptime(
        l["newest_published_date"], "%Y-%m-%d")
    published_year = newest_published_date.year
    current_year = datetime.now().year
    # Select only recently published lists, and not audio
    if published_year == current_year and not "audio" in list_name_encoded:
        # Create a list and append it to lists_in_db
        db_list = crud.create_list(
            list_name=display_name, nyt_list_name_encoded=list_name_encoded)
        lists_in_db.append(db_list)

# Add all lists to the SQLAlchemy session and commit them to db
model.db.session.add_all(lists_in_db)
model.db.session.commit()


# Get books for each list from the New York Times Best Sellers Lists
# for each book added to the db get additional data such as
# book covers, authors, descriptions, and categories from Google Books API
for db_list in lists_in_db:
    # There are two rate limits per API:
    # 500 requests per day and 5 requests per minute.
    # You should sleep 12 seconds between calls to avoid hitting the per minute rate limit
    # from https://developer.nytimes.com/faq
    sleep(12)

    url = f"https://api.nytimes.com/svc/books/v3/lists/current/{db_list.nyt_list_name_encoded}.json"
    payload = {"api-key": NYT_API_KEY}
    res = requests.get(url, params=payload)
    print(res.url)
    print("res:", res)
    data = res.json()
    total_items = data["num_results"]
    if total_items != 0:
        books = data["results"]["books"]
    else:
        books = []

    for book in books:
        # Get book data
        title = book["title"]
        primary_isbn10 = book["primary_isbn10"]
        # primary_isbn10 can be empty!!!
        primary_isbn13 = book["primary_isbn13"]

        # Check that the book is already in db
        db_book = crud.get_book_by_isbn13(primary_isbn13)
        if db_book == None:
            description = book["description"]
            contributor_note = book["contributor_note"].capitalize()
            db_book = crud.create_book(
                title=title,
                isbn10=primary_isbn10,
                isbn13=primary_isbn13,
                description=description,
                contributor_note=contributor_note)
            # Add the book to the SQLAlchemy session and commit it to db
            model.db.session.add(db_book)
            model.db.session.commit()
            # Get book cover
            db_cover = crud.create_cover(
                db_book.book_id, book["book_image"], 'NYT')
            # Add the cover to the SQLAlchemy session and commit it to db
            model.db.session.add(db_cover)
            model.db.session.commit()
            # Get book authors, description, and categories from Google Books API
            success = get_book_data_google_books_api(db_book)
            if not success:
                # create author from NYT data
                get_book_authors_nyt(book["author"], db_book.book_id)
            # get category for list name
            categories = get_categories_for_list(db_list.list_name)
            add_categories_to_db(categories, db_book.book_id)
        # add book-list association
        db_book_list = crud.create_book_list(
            db_book.book_id, db_list.list_id)
        model.db.session.add(db_book_list)
        model.db.session.commit()


# Create 10 test users
for n in range(10):
    email = f"user{n}@test.com"
    name = f"Test User {n}"
    password = f"testB00kUser{n}"

    user = crud.create_user(name, email, password)
    model.db.session.add(user)
model.db.session.commit()


print("NUM_OF_REQUESTS = ", NUM_OF_REQUESTS)
