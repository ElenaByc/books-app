# <a name="top"></a> Pick Me a Book App <br> Hackbright Academy Capstone Project


Don't know what to read next? Find your next favorite book, series, or author with this book recommendation app!  
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
* [About Me & Contact Me](#contactme)

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
<img src="/static/img/demo1.gif" alt="searching books demo" width="800"/>
</p>
<br/><br/>

Users can view a book's details by clicking on the book's card
<p align="center">
<img src="/static/img/demo2.gif" alt="book's details demo"/>
</p>
<br/><br/>

Registered users can put a book on their "To Read" bookshelf if they plan to read it later
<p align="center">
<img src="/static/img/demo3.gif" alt="put a book on the To Read shelf demo"/>
</p>
<br/><br/>

Registered users can put a book on their "Already Read" shelf in case they have read the book before
<p align="center">
<img src="/static/img/demo4.gif" alt="put a book on the Already Read shelf demo"/>
</p>
<br/><br/>

Registered users can see all the books on their shelves on the Bookshelf page
<p align="center">
<img src="/static/img/demo5.gif" alt="bookshelf demo"/>
</p>
<br/><br/>

Registered users can mark a book on their "To Read" shelf as already read  
and move the book to their "Already Read" shelf
<p align="center">
<img src="/static/img/demo6.gif" alt="mark as already read demo"/>
</p>
<br/><br/>

Registered users can mark a book on their "Already Read" shelf as their favorite  
and put the book on their "Favorites" shelf
<p align="center">
<img src="/static/img/demo7.gif" alt="mark as favorite demo"/>
</p>
<br/><br/>

Registered users can mark a book on their "Favorites" shelf as "Want To Read Again"  
and put the book on their "To Read" shelf
<p align="center">
<img src="/static/img/demo8.gif" alt="mark as want to read again demo"/>
</p>
<br/><br/>

Registered users can delete any book from any of their three shelves 
<p align="center">
<img src="/static/img/demo9.gif" alt="remove a book demo"/>
</p>
<br/><br/>

Registered users can request book recommendations based on their "Favorites" shelf 
<p align="center">
<img src="/static/img/demo10.gif" alt="search by favorites demo"/>
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
cd books-app
virtualenv env
source env/bin/activate
```

4. Install the dependencies:

```
pip3 install -r requirements.txt
```

5. Create credentials  
  5.1. New York Times Books API  
    &nbsp;&nbsp;&nbsp;&nbsp;[Here](https://developer.nytimes.com/get-started) is the detailed instruction on how to get the New York Times Books API key.  
  5.2. Google Books API  
    &nbsp;&nbsp;&nbsp;&nbsp;To acquire Google Books API Key open the [Credentials page](https://console.cloud.google.com/apis/credentials) in the API Console.  
    &nbsp;&nbsp;&nbsp;&nbsp;Then create an API key in the Console by clicking Create credentials > API key.
    
7. Save your credentials in a file called <kbd>secrets.sh</kbd> using this format:

```
export GOOGLE_BOOKS_KEY="YOUR_KEY_HERE"
export NYT_KEY="YOUR_KEY_HERE"
```

7. Also add a secret key for flask app to <kbd>secrets.sh</kbd>:

```
export APP_KEY="YOUR_KEY_HERE"
```

8. Source your keys from your secrets.sh file into your virtual environment:

```
source secrets.sh
```

9. Set up the database
    
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  9.1 Create database <kbd>books</kbd>:
   
  ```
  createdb books
  ```

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  9.2 Seed the database with current The New York Times best sellers data:
  
  ```
  python seed_database.py
  ```

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  Or you can get the data from  <kbd>books.sql</kbd> (last updated on June 11, 2023)
  
  ```
  psql books < books.sql
  ```

10. Run the app:

```
python server.py
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
