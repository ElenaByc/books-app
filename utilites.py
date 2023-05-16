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
