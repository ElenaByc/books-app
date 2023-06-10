const Bookshelf = () => {

  const [toReadBooks, setToReadBooks] = React.useState([]);
  const [alreadyReadBooks, setAlreadyReadBooks] = React.useState([]);
  const [favoriteBooks, setFavoriteBooks] = React.useState([]);
  const [status1, setStatus1] = React.useState("LOADING");
  const [status2, setStatus2] = React.useState("LOADING");
  const [status3, setStatus3] = React.useState("LOADING");
  const [msg, setMsg] = React.useState("")

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=read")
      .then((response) => response.json())
      .then((resp) => {
        setToReadBooks(resp.books);
        setStatus1(resp.status);
      })
  }, []);

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=already")
      .then((response) => response.json())
      .then((resp) => {
        setAlreadyReadBooks(resp.books);
        setStatus2(resp.status);
      })
  }, []);

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=favorites")
      .then((response) => response.json())
      .then((resp) => {
        setFavoriteBooks(resp.books);
        setStatus3(resp.status);
      })
  }, []);


  const removeFromShelf = (book, shelf) => {
    if (shelf === "To Read") {
      const currentToReadBooks = [...toReadBooks];
      const index = currentToReadBooks.indexOf(book);
      currentToReadBooks.splice(index, 1);
      setToReadBooks([...currentToReadBooks]);
    } else if (shelf === "Already Read") {
      const currentAlreadyReadBooks = [...alreadyReadBooks];
      const index = currentAlreadyReadBooks.indexOf(book);
      currentAlreadyReadBooks.splice(index, 1);
      setAlreadyReadBooks([...currentAlreadyReadBooks]);
    } else if (shelf === "Favorites") {
      const currentFavoriteBooks = [...favoriteBooks];
      const index = currentFavoriteBooks.indexOf(book);
      currentFavoriteBooks.splice(index, 1);
      setFavoriteBooks([...currentFavoriteBooks]);
    }
  }

  const addToAlreadyRead = (book, message) => {
    removeFromShelf(book, "To Read");
    const currentAlreadyReadBooks = [...alreadyReadBooks];
    setAlreadyReadBooks([...currentAlreadyReadBooks, book]);
  }

  const addToFavorites = (book) => {
    const currentFavoriteBooks = [...favoriteBooks];
    setFavoriteBooks([...currentFavoriteBooks, book]);
  }

  const addToRead = (book) => {
    const currentToReadBooks = [...toReadBooks];
    setToReadBooks([...currentToReadBooks, book]);
  }

  return (
    <>
      <h2>My bookshelf</h2>
      {msg !== "" && <MessageBox msg={msg} setMsg={setMsg} location="bookshelf" />}
      <BooksContainer
        shelf="To Read"
        books={toReadBooks}
        status={status1}
        handleLeftBtn={removeFromShelf}
        handleRightBtn={addToAlreadyRead}
        setMsg={setMsg}
      />
      <BooksContainer
        shelf="Already Read"
        books={alreadyReadBooks}
        status={status2}
        handleLeftBtn={removeFromShelf}
        handleRightBtn={addToFavorites}
        setMsg={setMsg}
      />
      <BooksContainer
        shelf="Favorites"
        books={favoriteBooks}
        status={status3}
        handleLeftBtn={removeFromShelf}
        handleRightBtn={addToRead}
        setMsg={setMsg}
      />
    </>
  );
}

ReactDOM.render(<Bookshelf />, document.querySelector("#bookshelf"));
