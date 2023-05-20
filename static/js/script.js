const select = document.querySelector('#shelf')
const submitButton = document.querySelector('.to-shelf-form input[type=submit]');
console.log(submitButton)
select.addEventListener('change', () => {
  if (select.value != 'read' && select.value !== "already") {
    submitButton.disabled = true;
  } else {
    submitButton.disabled = false;
  }
});