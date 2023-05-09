"""Script to seed database."""

import os
import json
from random import choice, randint
from datetime import datetime

import crud
import model
import server

# re-create a database
os.system('dropdb books')
os.system('createdb books')

# Connect to the database and call db.create_all:
model.connect_to_db(server.app)
model.db.create_all()

# get all Best Sellers Lists from New York Times Books API
# and create subjects data based on this lists


# For each list/subject from New York Times Best Sellers Lists get books
# and store them in list of books
# books_in_db = []


# Create 10 test users
for n in range(10):
    email = f"user{n}@test.com"
    password = "test"

    user = crud.create_user(email, password)
    model.db.session.add(user)
model.db.session.commit()
