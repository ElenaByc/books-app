const BooksContainer = (props) => {
  const [bookData, setBookData] = React.useState([]);

  React.useEffect(() => {
    fetch("/api/books")
      .then((response) => response.json())
      .then((books) => {
        console.log(books)
        setBookData(books);
      })
  }, []);

  return (
    <div className="books__cards-container">
      {bookData.length > 0
        ? (bookData.map((book) => <BookCard book={book} key={book.book_id} />))
        // : <h4>Your <span className="shelf-type">{props.shelfType}</span> bookshelf is empty</h4>
        : <h4>Loading...</h4>
        // ??? want to show Loading while loading and then 
        // Your bookshelf is empty whet there is no books on the bookshelf
      }
    </div>
  );
}