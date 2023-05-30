from sortedcontainers import SortedDict


def format_uppercase_string(str):
    if str.isupper():
        # Capitalize each word in category
        words = str.split()
        if len(words) > 1:
            result = []
            for word in words:
                result.append(word.capitalize())
            formatted_name = " ".join(result)
        else:
            formatted_name = str.capitalize()

        return formatted_name


def split_categories(categories):
    result = []
    for c_str in categories:
        result.extend(c_str.split(" / "))
    result = list(set(result))
    if "General" in result:
        result.remove("General")
    return result


def get_categories_for_list(list_name):
    categories_dict = {
        "Fiction": "Fiction",
        "Nonfiction": "Nonfiction",
        "Business": "Business",
        "Children": "Children's Books",
        "Young Adult": "Young Adult Books",
        "Middle Grade": "Middle Grade Books",
        "Graphic Books": "Graphic Books",
        "Advice, How-To": "Advice & How-To",
    }
    result = []
    for key, value in categories_dict.items():
        if key in list_name:
            result.append(value)

    return result


def create_user_preferences_dict(favorite_books):
    """Create a dictionary - frequency count for the NYT lists, authors and categories"""

    fav_dict = {
        "lists": {},
        "authors": {},
        "categories": {},
    }

    for book in favorite_books:
        # lists
        for l in book.lists:
            fav_dict["lists"][l] = fav_dict["lists"].get(l, 0) + 1
        # authors
        for a in book.authors:
            fav_dict["authors"][a] = fav_dict["authors"].get(a, 0) + 1
        # categories
        for c in book.categories:
            fav_dict["categories"][c] = fav_dict["categories"].get(
                c, 0) + 1

    return fav_dict


def get_recommendations(all_books, fav_dict, limit):
    """ For each book if all_books calculate rating 
        based on fav_dict and return a list with no more than 
        limit number of books with the highest rating"""

    sd = SortedDict()
    books = []

    for book in all_books:
        book_raiting = 0
        for author in book.authors:
            if author in fav_dict["authors"]:
                book_raiting += fav_dict["authors"][author]
        for l in book.lists:
            if l in fav_dict["lists"]:
                book_raiting += fav_dict["lists"][l]
        for category in book.categories:
            if category in fav_dict["categories"]:
                book_raiting += fav_dict["categories"][category]

        # sd[book_raiting] = sd.get(book_raiting, []).append(book)
        if book_raiting in sd:
            sd[book_raiting].append(book)
        else:
            sd[book_raiting] = [book]

    # for testing purpose
    # print sorted dictionary with raitings and books
    for key, value in sd.items():
        print(key, ":")
        for book in value:
            print("    ", book)
        print()

    print(len(sd))

    # return top limit number of books from sd
    number_of_records = len(sd)
    idx = number_of_records - 1
    while idx >= 0 and len(books) < limit:
        books.extend(sd.peekitem(index=idx)[1])
        idx -= 1

    return books


def sqlalchemy_book_obj_to_dict(book_obj):
    """Convert a SQLAlchemy Book object to a dictionary."""

    book_dict = {}
    for column in book_obj.__table__.columns:
        book_dict[column.name] = getattr(book_obj, column.name)

    authors = []
    for author in book_obj.authors:
        authors.append(author.name)
    book_dict["authors"] = authors

    covers = []
    for cover in book_obj.covers:
        covers.append(cover.cover_url)
    book_dict["covers"] = covers

    categories = []
    for category in book_obj.categories:
        categories.append(category.category_name)
    book_dict["categories"] = categories

    lists = []
    for l in book_obj.lists:
        lists.append(l.list_name)
    book_dict["lists"] = lists

    return book_dict
