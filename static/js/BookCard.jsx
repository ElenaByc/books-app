const BookCard = ({ book, shelf, handleLeftBtn, handleRightBtn, setMsg }) => {

  const [show, setShow] = React.useState(false);

  const handleCloseDetails = () => setShow(false);
  const handleShowDetails = () => setShow(true);

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
    <div className="card">
      {/* <Example book = {book}/> */}
      <div className="card_popup" onClick={handleShowDetails}>
        <div className="card_img" title="View book details">
          {(book.covers.length > 0)
            ? <img src={book.covers[0]} alt="book cover" />
            : <img src="/static/img/no-cover.jpg" alt="book cover is not available" />
          }
        </div>
        <div className="card_content">
          <h3>{book.title}</h3>
          <h4>{author_data}</h4>
        </div>
      </div>
      <ReactBootstrap.Modal
        show={show}
        onHide={handleCloseDetails}
        size="xl"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <ReactBootstrap.Modal.Header closeButton>
          <h2>Book Title: {book.title}</h2>
        </ReactBootstrap.Modal.Header>
        <ReactBootstrap.Modal.Body>
          <div className="book_details">
            <div>
              {(book.covers.length > 0)
                ? <img className="book_details__cover" src={book.covers[0]} alt="book cover" />
                : <img src="/static/img/no-cover.jpg" alt="book cover is not available" />
              }
              {book.walmart_link &&
                <h4><a href={book.walmart_link} target="_blank">Buy on Walmart</a></h4>
              }
            </div>
            <div className="book_details__content">
              <h4>{author_data}</h4>
              {book.contributor_note != "" && <h4>{book.contributor_note}</h4>}
              <h4>ISBN10 = {book.primary_isbn10}</h4>
              <h4>ISBN13 = {book.primary_isbn13}</h4>
              <h4>NEW YORK TIMES BESTSELLER in {book.lists.length}&nbsp;
                {book.lists.length > 1 ? <span>lists</span> : <span>list</span>}
              </h4>
              <ul>
                {book.lists.map((list_name) => <li key={list_name}>{list_name}</li>)}
              </ul>
              <h4>Categories:</h4>
              <ul>
                {book.categories.map((category_name) => <li key={category_name}>{category_name}</li>)}
              </ul>
              <h4>Description:</h4>
              <div dangerouslySetInnerHTML={{ __html: book.description }} />
            </div>
          </div>
        </ReactBootstrap.Modal.Body>
      </ReactBootstrap.Modal>
      {
        shelf !== "" &&
        <CardButtons
          shelf={shelf}
          book={book}
          handleLeftBtn={handleLeftBtn}
          handleRightBtn={handleRightBtn}
          setMsg={setMsg}
        />
      }
    </div >
  )
}
