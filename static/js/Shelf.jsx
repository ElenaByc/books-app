const Shelf = (props) => {
  return (
    <div className="shelf">
      <h3 className="shelf-header">{props.type}</h3>
      <BooksContainer shelfType={props.type} />
    </div>
  );
}