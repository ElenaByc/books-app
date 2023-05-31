const Bookshelf = () => {

  const [toReadBooks, setToReadBooks] = React.useState([]);
  const [alreadyReadBooks, setAlreadyReadBooks] = React.useState([]);
  const [favoriteBooks, setFavoriteBooks] = React.useState([]);
  const [status1, setStatus1] = React.useState("LOADING");
  const [status2, setStatus2] = React.useState("LOADING");
  const [status3, setStatus3] = React.useState("LOADING");

  // let status1 = "LOADING"
  // let status2 = "LOADING"
  // let status3 = "LOADING"

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=read")
      .then((response) => response.json())
      .then((resp) => {
        setToReadBooks(resp.books);
        setStatus1(resp.status);
        // status1 = resp.status;
        console.log("Inside fetch: status1 = ", status1);
      })
  }, []);

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=already")
      .then((response) => response.json())
      .then((resp) => {
        setAlreadyReadBooks(resp.books);
        setStatus2(resp.status);
        // status2 = resp.status;
        console.log("Inside fetch status2: ", status2);
      })
  }, []);

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=favorites")
      .then((response) => response.json())
      .then((resp) => {
        setFavoriteBooks(resp.books);
        setStatus3(resp.status);
        // status3 = resp.status;
        console.log("Inside fetch status3:", status3);
      })
  }, []);


  const removeFromShelf = (book, shelf) => {
    if (shelf === "To Read") {
      console.log("removing from To Read shelf")
      const currentToReadBooks = [...toReadBooks];
      const index = currentToReadBooks.indexOf(book);
      currentToReadBooks.splice(index, 1);
      setToReadBooks([...currentToReadBooks]);
    } else if (shelf === "Already Read") {
      console.log("removing from Already Read shelf")
      const currentAlreadyReadBooks = [...alreadyReadBooks];
      const index = currentAlreadyReadBooks.indexOf(book);
      currentAlreadyReadBooks.splice(index, 1);
      setAlreadyReadBooks([...currentAlreadyReadBooks]);
    } else if (shelf === "Favorites") {
      console.log("removing from Favorites shelf")
      const currentFavoriteBooks = [...favoriteBooks];
      const index = currentFavoriteBooks.indexOf(book);
      currentFavoriteBooks.splice(index, 1);
      setFavoriteBooks([...currentFavoriteBooks]);
    }
  }

  const addToAlreadyRead = (book) => {

  }

  const addToFavorites = (book) => {

  }

  const addToRead = (book) => {
    const currentToReadBooks = [...toReadBooks];
    setToReadBooks([...currentToReadBooks, book]);
  }

  return (
    <>
      <h2>My bookshelf</h2>
      {console.log("Rendering Bookshelf!!!!!!!!!!")}
      <BooksContainer
        shelf="To Read"
        books={toReadBooks}
        status={status1}
        handleLeftBtn={removeFromShelf}
        handleRightBtn={addToAlreadyRead}
      />
      <BooksContainer
        shelf="Already Read"
        books={alreadyReadBooks}
        status={status2}
        handleLeftBtn={removeFromShelf}
        handleRightBtn={addToFavorites}
      />
      <BooksContainer
        shelf="Favorites"
        books={favoriteBooks}
        status={status3}
        handleLeftBtn={removeFromShelf}
        handleRightBtn={addToRead}
      />
    </>
  );
}

ReactDOM.render(<Bookshelf />, document.querySelector("#bookshelf"));
