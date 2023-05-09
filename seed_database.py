"""Script to seed database."""

import os
import json
import requests
from random import choice, randint
from datetime import datetime

import crud
import model
import server


NYT_API_KEY = os.environ['NYT_KEY']


# re-create a database
os.system('dropdb books')
os.system('createdb books')

# Connect to the database and call db.create_all:
model.connect_to_db(server.app)
model.db.create_all()


# get all Best Sellers Lists from New York Times Books API
# and create subjects data based on this lists
url = 'https://api.nytimes.com/svc/books/v3/lists/names.json'
payload = {}
payload['api-key'] = NYT_API_KEY

res = requests.get(url, params=payload)
print(res)
print(res.url)
data = res.json()
total_items = data['num_results']
print(total_items)
if total_items != 0:
    subjects = data['results']
else:
    subjects = []

subjects_in_db = []

for subject in subjects:
    # Get the display_name and list_name_encoded, and
    display_name = subject['display_name']
    list_name_encoded = subject['list_name_encoded']
    # Get newest_published_date and convert it to a datetime object
    newest_published_date = datetime.strptime(
        subject['newest_published_date'], "%Y-%m-%d")
    published_year = newest_published_date.year
    current_year = datetime.now().year
    # print(type(published_year), published_year, current_year)
    # Select only recently published lists, and not audio
    if published_year == current_year and not 'audio' in list_name_encoded:
        # Create a subject and append it to subjects_in_db
        db_subject = crud.create_subject(
            subject=display_name, nyt_list_name=list_name_encoded)
        subjects_in_db.append(db_subject)

# Add all subjects to the SQLAlchemy session and commit them to db
model.db.session.add_all(subjects_in_db)
model.db.session.commit()


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
