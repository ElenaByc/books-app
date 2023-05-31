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

  return (
    <div className="card_buttons">
      <a href={`/remove/${book.book_id}`}>
        <div className="remove-icon" title="Remove this book"></div>
      </a>
      {shelf === "To Read" && <a href={`/read/${book.book_id}`}>
        <div className="checkmark-icon" title="Mark this book as Already Read"></div>
      </a>}
      {shelf === "Already Read" && <a href="/favorite/{{ book.book_id }}">
        <div className="heart-icon" title="Mark this book as your favorite"></div>
      </a>}
      {shelf === "Favorites" &&
        <div className="read-icon" title="Want to read it again" onClick={handleAddToRead}></div>}
    </div>
  )
}