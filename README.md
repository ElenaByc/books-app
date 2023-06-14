# <a name="top"></a> Pick Me a Book App 
 
**Pick Me a Book App** is a full-stack web application that allows users to get book recommendations based on their personal preferences. 
Users can choose to get recommendations by author, title, category, or the New York Time best sellers list. 
Registered users can also request recommendations based on their favorite books. 
Users can view recommended book details and decide whether to read this book. 
A registered user can put a book on their "To Read" bookshelf if they plan to read it later, 
or they can put a book on their "Already Read" shelf in case they have read the book before. 
On the bookshelf page, registered users can see all the books they put on their "To read" and " Already Read" shelves. 
Users can edit their bookshelf by removing books or moving them from one shelf to another.

## Deployment
Pick Me a Book App was deployed on AWS using LightSail, public static IP address: [54.244.13.163](http://54.244.13.163)

## Demo video
[youtu.be/0xMmzJnSzEE]( https://youtu.be/0xMmzJnSzEE)

## Contents
* [Tech Stack](#technologies)
* [Data Model](#model)
* [Features](#features)
* [Installation](#install)
* [Contact Me](#contactme)

## <a name="technologies"></a>Tech Stack
- **Backend**
  - Python
  - Flask
  - PostgreSQL
  - SQLAlchemy
- **Frontend**
  - Jinja2
  - JavaScript
  - React
  - React-Bootstrap
  - AJAX
  - JSON
  - HTML5
  - CSS3
- **Python Libraries**
  - Beautiful Soup
  - Passlib
  - SortedDict
- **APIs**
  - New York Times Books API
  - Google Books API

<p align="right">[back to top](#top)</p>

## <a name="features"></a>Features





## <a name="install"></a>Installation

To run the Pick Me a Book App:

1. Install PostgreSQL, Python 3.9, and [virtualenv](https://virtualenv.pypa.io/en/latest/installation.html)

2. Clone or fork this repo:

```
https://github.com/ElenaByc/books-app.git
```

3. Create and activate a virtual environment inside the books-app directory:

```
virtualenv env
source env/bin/activate
```

4. Install the dependencies:

```
pip3 install -r requirements.txt
```

5. Create credentials  
  5.1. New York Times Books API  
  5.2. Google Books API

6. Save your credentials in a file called <kbd>secrets.sh</kbd> using this format:

```
export GOOGLE_BOOKS_KEY="YOUR_KEY_HERE"
export NYT_KEY="YOUR_KEY_HERE"
```

Also add a secret key for flask app to <kbd>secrets.sh</kbd>:

```
export APP_KEY="YOUR_KEY_HERE"
```

Source your keys from your secrets.sh file into your virtual environment:

```
source secrets.sh
```

Set up the database:

```
createdb books
```

To seed database with demo data:

```
python3 seed_database.py
```

Run the app:

```
python3 server.py
```

You can now navigate to 'localhost:5000/' to access the Pick Me a Book App app.

## <a name="contactme"></a>Contact Me
 [LinkedIn](https://www.linkedin.com/in/elena-bychenkova/).
