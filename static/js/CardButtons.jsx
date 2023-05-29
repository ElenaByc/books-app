const CardButtons = ({ book }) => {
  return (
    <div className="card_buttons">
      <a href={`/remove/${book.book_id}`}>
        <div className="remove-icon" title="Remove this book"></div>
      </a>
      <a href={`/read/${book.book_id}`}>
        <div className="checkmark-icon" title="Mark this book as Already Read"></div>
      </a>
    </div>
  )
}