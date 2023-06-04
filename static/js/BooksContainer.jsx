const BooksContainer = (props) => {
  return (
    <section className="books">
      {console.log("Rendering BooksContainer", props.shelf, props.status)}
      {props.shelf !== ""
        ? <h3 className="books__header">{props.shelf}</h3>
        : <h3 className="books__header">{props.header}</h3>
      }
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
            ? <h4>Loading...</h4>
            : props.shelf !== ""
              ? <h4>Your <span className="shelf-type">{props.shelf}</span> bookshelf is empty</h4>
              : <h4>Sorry, no books matching your request. Please try different search parameters.</h4>
        }
      </div>
    </section>
  )
}
