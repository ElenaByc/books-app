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
