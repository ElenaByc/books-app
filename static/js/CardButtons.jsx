const CardButtons = ({ book, shelf, handleLeftBtn, handleRightBtn }) => {

  const handleAddToRead = () => {
    // alert("add to read")
    fetch("/to-read", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ "book_id": book.book_id }),
    })
      .then((response) => response.json())
      .then((jsonResponse) => {
        if (jsonResponse.success) {
          handleRightBtn(book);
        }
      });
  }

  const handleRemoveFromShelf = () => {
    // alert("remove from " + shelf)
    fetch("/remove", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ "book_id": book.book_id, "shelf": shelf }),
    })
      .then((response) => response.json())
      .then((jsonResponse) => {
        if (jsonResponse.success) {
          handleLeftBtn(book, shelf);
        }
      });
  }

  return (
    <div className="card_buttons">
      <div className="remove-icon" title="Remove this book" onClick={handleRemoveFromShelf}></div>
      {shelf === "To Read" &&
        <div className="checkmark-icon" title="Mark this book as Already Read"></div>
      }
      {shelf === "Already Read" &&
        <div className="heart-icon" title="Mark this book as your favorite"></div>
      }
      {shelf === "Favorites" &&
        <div className="read-icon" title="Want to read it again" onClick={handleAddToRead}></div>
      }
    </div>
  )
}