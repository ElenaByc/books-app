"""Script to seed database."""

import os
import json
import requests
from random import choice, randint
from datetime import datetime
from time import sleep

import crud
import model
import server


NYT_API_KEY = os.environ["NYT_KEY"]


# re-create a database
os.system("dropdb books")
os.system("createdb books")

# Connect to the database and call db.create_all:
model.connect_to_db(server.app)
model.db.create_all()


# get all Best Sellers Lists from New York Times Books API
# and create categories data based on this lists
url = "https://api.nytimes.com/svc/books/v3/lists/names.json"
payload = {}
payload["api-key"] = NYT_API_KEY

res = requests.get(url, params=payload)
data = res.json()
total_items = data["num_results"]
if total_items != 0:
    categories = data["results"]
else:
    categories = []

categories_in_db = []

for category in categories:
    # Get the display_name and list_name_encoded, and
    display_name = category["display_name"]
    list_name_encoded = category["list_name_encoded"]
    # Get newest_published_date and convert it to a datetime object
    newest_published_date = datetime.strptime(
        category["newest_published_date"], "%Y-%m-%d")
    published_year = newest_published_date.year
    current_year = datetime.now().year
    # Select only recently published lists, and not audio
    if published_year == current_year and not "audio" in list_name_encoded:
        # Create a category and append it to categories_in_db
        db_category = crud.create_category(
            category=display_name, nyt_list_name=list_name_encoded)
        categories_in_db.append(db_category)

# Add all categories to the SQLAlchemy session and commit them to db
model.db.session.add_all(categories_in_db)
model.db.session.commit()


# Get books for each category from New York Times Best Sellers Lists
# TODO: for each book added to the db get additional data such as
# book covers, authors, and subjects/topics from Open Library API
for category in categories_in_db:
    # There are two rate limits per API:
    # 500 requests per day and 5 requests per minute.
    # You should sleep 12 seconds between calls to avoid hitting the per minute rate limit
    # from https://developer.nytimes.com/faq
    sleep(12)
    url = f"https://api.nytimes.com/svc/books/v3/lists/current/{category.nyt_list_name_encoded}.json"
    payload = {}
    payload["api-key"] = NYT_API_KEY
    res = requests.get(url, params=payload)
    print(res.url)
    print("res:", res)
    data = res.json()
    # print("data:", data)
    total_items = data["num_results"]
    print(total_items)
    if total_items != 0:
        books = data["results"]["books"]
    else:
        books = []

    for book in books:
        # Get book data
        title = book["title"]
        primary_isbn10 = book["primary_isbn10"]
        # TODO:primary_isbn10 can be empty!!! => get it from another API or another field???
        primary_isbn13 = book["primary_isbn13"]

        # check that the book is not in db
        if crud.get_book_by_isbn13(primary_isbn13) == None:
            description = book["description"]
            db_book = crud.create_book(
                title=title, isbn10=primary_isbn10, isbn13=primary_isbn13, overview=description)
            # Add the book to the SQLAlchemy session and commit it to db
            model.db.session.add(db_book)
            model.db.session.commit()
        else:
            db_book = crud.get_book_by_isbn13(primary_isbn13)
        db_book_category = crud.create_book_category(
            db_book.book_id, category.category_id)
        model.db.session.add(db_book_category)
        model.db.session.commit()


# Create 10 test users
for n in range(10):
    email = f"user{n}@test.com"
    password = "test"

    user = crud.create_user(email, password)
    model.db.session.add(user)
model.db.session.commit()
