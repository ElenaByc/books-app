const BooksContainer = (props) => {

  const bookCards = [];

  for (const book of props.books) {
    bookCards.push(
      <BookCard
        book={book}
        key={book.book_id}
        shelf={props.shelf}
        handleLeftBtn={props.handleLeftBtn}
        handleRightBtn={props.handleRightBtn}
      />,
    );
  }

  return (
    <div className="shelf">
      <h3 className="shelf-header">{props.shelf}</h3>
      <div className="books__cards-container">
        {bookCards.length > 0
          ? bookCards
          : props.status === "NO DATA"
            ? <h4>Your <span className="shelf-type">{props.shelfType}</span> bookshelf is empty</h4>
            : <h4>Loading...</h4>
        }
      </div>
    </div>
  )
}