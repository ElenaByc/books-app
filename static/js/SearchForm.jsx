const SearchForm = () => {
  const [isLoggedIn, setIsLoggedIn] = React.useState(false);
  const [option, setOption] = React.useState("");
  const [listsArray, setListsArray] = React.useState([]);
  const [checkmark, setCheckmark] = React.useState(true);
  const [searchQuery, setSearchQuery] = React.useState("");
  const [searchResults, setSearchResults] = React.useState([]);
  const [searchHeader, setSearchHeader] = React.useState("");
  const [searchStatus, setSearchStatus] = React.useState("");
  const [search, setSearch] = React.useState(false);
  const [msg, setMsg] = React.useState("")

  React.useEffect(() => {
    fetch("/api/logged-in")
      .then((response) => response.json())
      .then((resp) => {
        console.log("Inside fetch1: resp = ", resp);
        setIsLoggedIn(resp);
      })
  }, []);

  React.useEffect(() => {
    fetch("/api/lists")
      .then((response) => response.json())
      .then((resp) => {
        console.log("Inside fetch2: resp = ", resp);
        setListsArray(resp.lists);
      })
  }, []);

  React.useEffect(() => {
    if (search && searchResults.length === 0 && searchQuery !== "") {
      fetch(`/api/books?${searchQuery}`)
        .then((response) => response.json())
        .then((resp) => {
          setSearchResults(resp.books);
          setSearchStatus(resp.status);
          setSearchHeader(resp.header);
          setSearch(false)
        })
    }
  }, [search]);

  React.useEffect(() => {
    if (searchQuery !== "") {
      const newSearchQuery = `${searchQuery.slice(0, searchQuery.indexOf("checkmark="))}checkmark=${checkmark}`;
      setSearchQuery(newSearchQuery);
    }
  }, [checkmark]);

  React.useEffect(() => {
    if (option !== "") {
      if (option !== "favorites") {
        setSearchQuery("");
      } else {
        setSearchQuery(`option=${option}&checkmark=${checkmark}`);
      }
    }
  }, [option]);

  function handleOptionSelect(evt) {
    console.log(evt.target.value);
    setOption(evt.target.value);
  }

  function handleListSelect(evt) {
    console.log("list selected ", evt.target.value);
    setSearchQuery(`option=${option}&list=${evt.target.value}&checkmark=${checkmark}`);
  }

  function handleAuthorChange(evt) {
    console.log("author: ", evt.target.value);
    if (evt.target.value !== "") {
      setSearchQuery(`option=${option}&author=${evt.target.value}&checkmark=${checkmark}`);
    } else {
      setSearchQuery("");
    }
  }

  function handleTitleChange(evt) {
    console.log("title: ", evt.target.value);
    if (evt.target.value !== "") {
      setSearchQuery(`option=${option}&title=${evt.target.value}&checkmark=${checkmark}`);
    } else {
      setSearchQuery("");
    }
  }

  function handleCategoryChange(evt) {
    console.log("category: ", evt.target.value);
    if (evt.target.value !== "") {
      setSearchQuery(`option=${option}&category=${evt.target.value}&checkmark=${checkmark}`);
    } else {
      setSearchQuery("");
    }
  }

  const handleCheckmarkChange = () => {
    console.log("checkmark ", checkmark);
    setCheckmark(!checkmark);
  }

  function handleSubmit(evt) {
    evt.preventDefault();
    console.log("searchQuery: ", searchQuery);
    setSearchResults([])
    setMsg("")
    setSearchStatus("LOADING")
    setSearch(true)
  }

  const handleBtn = (book) => {
    console.log(book, "was added to the user's bookshelf")
  }

  return (
    <>
      <div className="search-container">
        <h3 className="search-header">Pick Me a Book</h3>

        <form className="search-form" onSubmit={handleSubmit}>
          <div>
            <label htmlFor="options">Choose books</label>
            <select defaultValue={"DEFAULT"} onChange={handleOptionSelect}>
              <option value="DEFAULT" disabled> -- select an option -- </option>
              <option value="author">by author</option>
              <option value="title">by title</option>
              <option value="category">by category</option>
              <option value="list">by NYT best sellers list</option>
              {isLoggedIn &&
                <option value="favorites">based on my Favorites</option>
              }
            </select>
          </div>
          {option === "author" &&
            <div>
              <label htmlFor="author">Author</label>
              <input id="author" type="text" placeholder="example: Pilkey" onChange={handleAuthorChange} />
            </div>
          }
          {option === "title" &&
            <div>
              <label htmlFor="title">Title</label>
              <input id="title" type="text" placeholder="example: games" onChange={handleTitleChange} />
            </div>
          }
          {option === "category" &&
            <div>
              <label htmlFor="category">Category</label>
              <input id="category" type="text" placeholder="example: Fantasy" onChange={handleCategoryChange} />
            </div>
          }
          {option === "list" &&
            <div>
              <label htmlFor="list">Best Sellers List</label>
              <select id="list-select" defaultValue={"DEFAULT"} onChange={handleListSelect}>
                <option value="DEFAULT" disabled> -- select a list -- </option>
                {listsArray.length > 0
                  ? listsArray.map((l) => <option value={l.list_id} key={l.list_id}>{l.list_name}</option>)
                  : <option disabled>Loading...</option>
                }
              </select>
            </div>
          }

          {isLoggedIn &&
            <div>
              <input type="checkbox" id="checkmark" onChange={handleCheckmarkChange} defaultChecked />
              <label htmlFor="checkmark" className="label">Do not recommend me books that already on my bookshelf</label>
            </div>
          }

          <input type="submit" value="Get Recommendations!" disabled={!searchQuery} />
        </form>
      </div>
      {msg !== "" && <MessageBox msg={msg} setMsg={setMsg} location="home"/>}
      {searchStatus !== "" &&
        <BooksContainer
          shelf=""
          header={searchHeader}
          books={searchResults}
          status={searchStatus}
          handleLeftBtn={handleBtn}
          handleRightBtn={handleBtn}
          setMsg={setMsg}
        />
      }
    </>
  );
}

ReactDOM.render(<SearchForm />, document.querySelector("#search"));