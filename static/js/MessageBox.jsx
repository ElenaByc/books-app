const MessageBox = ({ msg, setMsg, location }) => {

  const closeMessageBox = () => setMsg("");

  return (
    <div className="flash-msg">
      {msg.success
        ? <div className="success-icon"></div>
        : <div className="error-icon"></div>
      }

      {msg.shelf === ""
        ? <div>{msg.message}</div>
        : location === "home"
          ? <div>{msg.message.slice(0, msg.message.indexOf("bookshelf"))}
            <a href="/bookshelf"><span className="shelf-type">{msg.shelf}</span></a>&nbsp;bookshelf</div>
          : <div>{msg.message.slice(0, msg.message.indexOf("bookshelf"))}
            <a href={`#${msg.shelf.slice(0, 2)}`} ><span className="shelf-type">{msg.shelf}</span></a>&nbsp;bookshelf</div>
      }

      <div className="close-icon" title="Close" onClick={closeMessageBox}></div>
    </div >
  )
}