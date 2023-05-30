const Bookshelf = () => {

  const [toReadBooks, setToReadBooks] = React.useState([]);
  const [alreadyReadBooks, setAlreadyReadBooks] = React.useState([]);
  const [favoriteBooks, setFavoriteBooks] = React.useState([]);
  const [status1, setStatus1] = React.useState("LOAD");
  const [status2, setStatus2] = React.useState("LOAD");
  const [status3, setStatus3] = React.useState("LOAD");

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=read")
      .then((response) => response.json())
      .then((resp) => {
        setToReadBooks(resp.books);
        setStatus1(resp.status);
        console.log(status1);
      })
  }, []);

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=already")
      .then((response) => response.json())
      .then((resp) => {
        setAlreadyReadBooks(resp.books);
        setStatus2(resp.status);
        console.log(status2);
      })
  }, []);

  React.useEffect(() => {
    fetch("/api/bookshelf?shelf=favorites")
      .then((response) => response.json())
      .then((resp) => {
        setFavoriteBooks(resp.books);
        setStatus3(resp.status);
        console.log(status3);
      })
  }, []);

  const addToRead = (book) => {
    const currentBooks = [...toReadBooks];
    setToReadBooks([...currentBooks, book]);
  }

  return (
    <>
      <h2>My bookshelf</h2>
      <BooksContainer 
        shelf="To Read" 
        books={toReadBooks} s
        tatus={status1} />
      <BooksContainer shelf="Already Read" books={alreadyReadBooks} status={status1} />
      <BooksContainer
        shelf="Favorites"
        books={favoriteBooks}
        status={status1} 
        handleAddToRead={addToRead}
        />
    </>
  );
}

ReactDOM.render(<Bookshelf />, document.querySelector("#bookshelf"));
