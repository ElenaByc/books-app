const select = document.querySelector("#shelf")
if (select) {
  const submitButton = document.querySelector('.to-shelf-form input[type=submit]');
  select.addEventListener("change", () => {
    if (select.value != "read" && select.value !== "already") {
      submitButton.disabled = true;
    } else {
      submitButton.disabled = false;
    }
  });
}

const options = document.querySelector("#options")
if (options) {
  const formFields = document.querySelectorAll(".form-field");
  const listSelection = document.querySelector("#list");
  const authorInput = document.querySelector("#author");
  const titleInput = document.querySelector("#title");
  const categoryInput = document.querySelector("#category");

  options.addEventListener("change", function () {
    const selectedOption = this.value;
    const showField = document.querySelector(`.${selectedOption}`);
    const showInput = document.querySelector(`#${selectedOption}`);

    // empty all fields values when option is changed
    listSelection.selectedIndex = 0
    authorInput.value = ""
    titleInput.value = ""
    categoryInput.value = ""
    listSelection.required = false
    authorInput.required = false
    titleInput.required = false
    categoryInput.required = false

    formFields.forEach((el) => el.classList.remove("show"));
    if (selectedOption !== "favorites") {
      showField.classList.add("show");
      showInput.required = true;
    }
  });
}
