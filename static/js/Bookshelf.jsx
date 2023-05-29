const Bookshelf = () => {
  return (
    <>
      <h2>My bookshelf</h2>
      <Shelf type="To Read" />
      <Shelf type="Already Read" />
      <Shelf type="Favorites" />
    </>
  );
}

ReactDOM.render(<Bookshelf />, document.querySelector("#bookshelf"));
