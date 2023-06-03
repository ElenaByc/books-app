const SearchForm = () => {
  const [isLoggedIn, setIsLoggedIn] = React.useState(false);
  const [option, setOption] = React.useState("");
  const [author, setAuthor] = React.useState("");
  const [title, setTitle] = React.useState("");
  const [category, setCategory] = React.useState("");
  const [listsArray, setListsArray] = React.useState([]);
  const [list, setList] = React.useState("");
  const [checkmark, setCheckmark] = React.useState(true);
  const [searchQuery, setSearchQuery] = React.useState("");
  const [search, setSearch] = React.useState(false);
  const [searchResults, setSearchResults] = React.useState([]);
  const [searchStatus, setSearchStatus] = React.useState("");
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
    if (searchQuery !== "") {
      fetch(`/api/books?${searchQuery}`)
        .then((response) => response.json())
        .then((resp) => {
          setSearchResults(resp.books);
          setSearchStatus(resp.status);
          console.log("Inside fetch3: ");
          console.log(searchResults)
        })
    }
  }, [search]);

  function handleOptionSelect(evt) {
    console.log(evt.target.value);
    setOption(evt.target.value);
    setAuthor("");
    setTitle("")
    setCategory("");
    setList("");
    setSearchQuery("");
  }

  function handleListSelect(evt) {
    console.log("list selected ", evt.target.value);
    setList(evt.target.value);
  }

  function handleCategoryChange(evt) {
    console.log("category selected ", evt.target.value);
    setCategory(evt.target.value);
    setSearchQuery(`option=${option}&category=${category}&checkmark=${checkmark}`);
    console.log("searchQuery: ", searchQuery);
  }

  function handleSubmit() {
    setSearchQuery(`option=${option}&category=${category}&checkmark=${checkmark}`);
    console.log("searchQuery: ", searchQuery);
    setSearchStatus("LOADING")
    setSearch(true);
  }

  const addToAlreadyRead = () => {
    console.log("addToAlreadyRead");
  }

  const addToRead = () => {
    console.log("addToRead");
  }


  return (
    <>
      <h3 className="search-header">Pick Me a Book</h3>

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
          <input id="author" type="text" name="author" />
        </div>
      }
      {option === "title" &&
        <div>
          <label htmlFor="title">Title</label>
          <input id="title" type="text" name="title" />
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
          <input type="checkbox" id="checkmark" name="checkmark" value="on" defaultChecked />
          <label htmlFor="checkmark" className="label">Do not recommend me books that already on my bookshelf</label>
        </div>
      }

      <input type="submit" value="Get Recommendations!" disabled={!searchQuery} onClick={handleSubmit} />


      <br></br>
      <br></br>
      {searchStatus !== "" &&
        <BooksContainer
          shelf=""
          books={searchResults}
          status={searchStatus}
          handleLeftBtn={addToRead}
          handleRightBtn={addToAlreadyRead}
          setMsg={setMsg}
        />
      }
    </>
  );
}

ReactDOM.render(<SearchForm />, document.querySelector("#search"));