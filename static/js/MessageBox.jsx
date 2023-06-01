const MessageBox = ({ msg, setMsg }) => {

  const closeMessageBox = () => setMsg("");

  return (
    <div className="flash-msg">
      {msg.success
        ? <div className="success-icon"></div>
        : <div className="error-icon"></div>
      }

      {msg.shelf === ""
        ? <div>{msg.message}</div>
        : <div>{msg.message.slice(0, msg.message.indexOf("bookshelf"))}
          <span className="shelf-type">{msg.shelf}</span>&nbsp;bookshelf</div>
      }

      {/* <div dangerouslySetInnerHTML={{__html: message}} /> */}
      <div className="close-icon" title="Close" onClick={closeMessageBox}></div>
    </div >
  )
}