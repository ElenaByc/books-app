const MessageBox = ({ msg, setMsg }) => {

  const closeMessageBox = () => setMsg("")

  const [status, message] = msg.split('|');

  return (
    <div className="flash-msg">
      {status === "OK"
        ? <div className="success-icon"></div>
        : <div className="error-icon"></div>
      }
      <div>
        {message}
      </div>
      <div className="close-icon" onClick={closeMessageBox}></div>
    </div>
  )
}