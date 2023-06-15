# <a name="top"></a> Pick Me a Book App <br> Hackbright Academy Capstone Project


Don't know what to read next? Find your next favorite book, series, or author with this recommendation app!  
**Pick Me a Book App** is a full-stack web application allowing users to get book recommendations based on their preferences. 
Users can choose to get recommendations by author, title, category, or the New York Times best sellers list. 
Registered users can also request recommendations based on their favorite books. 
Users can view recommended book details and decide whether to read this book. 
A registered user can put a book on their "To Read" bookshelf if they plan to read it later, 
or they can put a book on their "Already Read" shelf in case they have read the book before. 
Registered users can see all the books they put on their "To read" and " Already Read" shelves on the bookshelf page. 
Users can edit their bookshelf by removing books or moving them from one shelf to another.

## Deployment
Pick Me a Book App was deployed on AWS using LightSail, public static IP address: [54.244.13.163](http://54.244.13.163)

## Demo Video
[youtu.be/0xMmzJnSzEE]( https://youtu.be/0xMmzJnSzEE)

## Contents
* [Tech Stack](#technologies)
* [Data Model](#model)
* [Features](#features)
* [Installation](#install)
* [Contact Me & Contact Me](#contactme)

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

<p align="right"><a href="#top">back to top</a></p>


## <a name="model"></a>Data Model
<p align="center">
<img src="/static/img/data-model.jpg" alt="Data Model Diagram"/>
</p>
<p align="right"><a href="#top">back to top</a></p>

## <a name="features"></a>Features
Users can get recommendations by author, title, category, or the New York Times best sellers list
<p align="center">
<img src="/static/img/demo1.gif" alt="searching books demo"/>
</p>

Users can view a book's details by clicking on the book's card
<p align="center">
<img src="/static/img/demo2.gif" alt="book's details demo"/>
</p>

Registered users can put a book on their "To Read" bookshelf if they plan to read it later
<p align="center">
<img src="/static/img/demo3.gif" alt="put a book on the To Read shelf demo"/>
</p>

Registered users can put a book on their "Already Read" shelf in case they have read the book before
<p align="center">
<img src="/static/img/demo4.gif" alt="put a book on the Already Read shelf demo"/>
</p>

<p align="right"><a href="#top">back to top</a></p>

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

<p align="right"><a href="#top">back to top</a></p>

## <a name="contactme"></a>About Me & Contact Me

Pick Me a Book App was created by me, Elena Bychenkova.  
Passionate software engineer with strong mathematical background.  
Learn more about me on [LinkedIn](https://www.linkedin.com/in/elena-bychenkova/).

Thank you for your interest in my project!  
I would love to connect and hear your feedback!  
GitHub: [github.com/ElenaByc](https://github.com/ElenaByc)  
email: [elena.bychenkova@gmail.com](mailto:elena.bychenkova@gmail.com)


 <p align="right"><a href="#top">back to top</a></p>
