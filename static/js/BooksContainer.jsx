const BooksContainer = (props) => {
  return (
    <section className="books" id={props.shelf.slice(0, 2)}>
      {props.shelf !== ""
        ? <h3 className="books__header">{props.shelf}</h3>
        : <h3 className="books__header">{props.header}</h3>
      }
      {props.books.length > 1 && <h3 className="books__subheader">{props.books.length} books</h3>}
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
                setMsg={props.setMsg}
              />
            )
          })
          : props.status === "LOADING"
            ? <h4 className="loading">Loading...</h4>
            : props.shelf !== ""
              ? <h4>Your <span className="shelf-type">{props.shelf}</span> bookshelf is empty</h4>
              : <h4>Sorry, no books matching your request. Please try different search parameters.</h4>
        }
      </div>
    </section>
  )
}
