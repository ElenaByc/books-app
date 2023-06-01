const BooksContainer = (props) => {
  return (
    <div className="shelf">
      {console.log("Rendering BooksContainer", props.shelf, props.status)}
      <h3 className="shelf-header">{props.shelf}</h3>
      <div className="books__cards-container">
        {props.books.length > 0
          ? props.books.map((book) => {
            return (
              <BookCard
                book={book}
                key={book.book_id}
                shelf={props.shelf}
                handleLeftBtn={props.handleLeftBtn}
                handleRightBtn={props.handleRightBtn}
              />
            )
          })
          : props.status === "NO DATA"
            ? <h4>Your <span className="shelf-type">{props.shelfType}</span> bookshelf is empty</h4>
            : <h4>Loading...</h4>}
      </div>
    </div>
  )
}
