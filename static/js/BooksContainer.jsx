const BooksContainer = (props) => {
  // const [bookData, setBookData] = React.useState([]);
  // const [status, setStatus] = React.useState("LOAD");

  // const url = "/api/bookshelf"
  // React.useEffect(() => {
  //   fetch(`${url}?shelf=${props.shelfType}`)
  //     .then((response) => response.json())
  //     .then((resp) => {
  //       // console.log(books);
  //       setBookData(resp.books);
  //       setStatus(resp.status)
  //       console.log(status);
  //     })
  // }, [status]);

  // return (
  //   <div className="shelf">
  //     <h3 className="shelf-header">{props.header}</h3>
  //     <div className="books__cards-container">
  //       {bookData.length > 0
  //         ? (bookData.map((book) =>
  //           <BookCard
  //             book={book}
  //             key={book.book_id}
  //             shelf={props.shelfType}
  //             addToRead={props.addToRead}
  //           />
  //         ))
  //         : props.status === "NO DATA"
  //           ? <h4>Your <span className="shelf-type">{props.shelfType}</span> bookshelf is empty</h4>
  //           : <h4>Loading...</h4>
  //       }
  //     </div>
  //   </div>
  // );

  const bookCards = [];

  for (const book of props.books) {
    bookCards.push(
      <BookCard
        book={book}
        key={book.book_id}
        shelf={props.shelf}
        addToRead={props.handleAddToRead}
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