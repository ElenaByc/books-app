const CardButtons = ({ book, shelf, handleLeftBtn, handleRightBtn, setMsg }) => {

  const handleAddToRead = () => {
    fetch("/to-read", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ "book_id": book.book_id }),
    })
      .then((response) => response.json())
      .then((jsonResponse) => {
        setMsg(jsonResponse);
        window.scrollTo({
          top: 0,
          left: 0,
          behavior: "smooth",
        });
        if (jsonResponse.success) {
          handleRightBtn(book);
        }
      });
  }

  const handleAddToAlreadyRead = () => {
    fetch("/to-already-read", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ "book_id": book.book_id }),
    })
      .then((response) => response.json())
      .then((jsonResponse) => {
        setMsg(jsonResponse);
        window.scrollTo({
          top: 0,
          left: 0,
          behavior: "smooth",
        });
        if (jsonResponse.success) {
          handleRightBtn(book);
        }
      });
  }

  const handleMarkAsFavorite = () => {
    fetch("/to-favorites", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ "book_id": book.book_id }),
    })
      .then((response) => response.json())
      .then((jsonResponse) => {
        setMsg(jsonResponse);
        window.scrollTo({
          top: 0,
          left: 0,
          behavior: "smooth",
        });
        if (jsonResponse.success) {
          handleRightBtn(book);
        }
      });
  }

  const handleRemoveFromShelf = () => {
    fetch("/remove", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ "book_id": book.book_id, "shelf": shelf }),
    })
      .then((response) => response.json())
      .then((jsonResponse) => {
        setMsg(jsonResponse);
        window.scrollTo({
          top: 0,
          left: 0,
          behavior: "smooth",
        });
        if (jsonResponse.success) {
          handleLeftBtn(book, shelf);
        }
      });
  }

  return (
    <div className="card_buttons">
      {shelf !== "" &&
        <div
          className="remove-icon"
          title="Remove this book"
          onClick={handleRemoveFromShelf}>
        </div>
      }
      {shelf === "To Read" &&
        <div
          className="checkmark-icon"
          title="Mark this book as Already Read"
          onClick={handleAddToAlreadyRead}>
        </div>
      }
      {shelf === "Already Read" &&
        <div
          className="heart-icon"
          title="Mark this book as your favorite"
          onClick={handleMarkAsFavorite}>
        </div>
      }
      {shelf === "Favorites" &&
        <div
          className="read-icon"
          title="Want to read it again"
          onClick={handleAddToRead}>
        </div>
      }
      {shelf === "" &&
        <div
          className="read-icon"
          title="Want to read"
          onClick={handleAddToRead}>
        </div>
      }
      {shelf === "" &&
        <div
          className="checkmark-icon"
          title="Mark this book as Already Read"
          onClick={handleAddToAlreadyRead}>
        </div>
      }
    </div>
  )
}