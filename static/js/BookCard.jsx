const BookCard = (props) => {
  const book = props.book;
  let author_data;
  if (book.authors.length > 1) {
    if (book.authors.length === 2) {
      author_data = `Authors: ${book.authors[0]} and ${book.authors[1]}`;
    } else {
      author_data = `Authors: ${book.authors[0]}`
      for (let i = 1; i < book.authors.length; i++) {
        if (i === book.authors.length - 1) {
          author_data += `, and ${book.authors[i]}`;
        } else {
          author_data += `, ${book.authors[i]}`;
        }
      }
    }
  } else {
    author_data = `Author: ${book.authors[0]}`;
  }
  return (
    <div key={book.book_id} className="card">
      <div className="card_img">
        <img src={book.cover} alt="book cover" />
      </div>
      <div className="card_content">
        <h3><a href={`/books/${book.book_id}`}>{book.title}</a></h3>
        <h4>{author_data}</h4>
      </div>
      {props.shelf !== "" && <CardButtons shelf={props.shelf} book={book} />}
    </div>
  )
}
