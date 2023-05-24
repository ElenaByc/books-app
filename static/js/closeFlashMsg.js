const closeBtns = document.querySelectorAll(".flash-msg .close-icon")
closeBtns.forEach(btn => btn.addEventListener("click", (e) => {
  const msgBox = e.target.parentElement;
  msgBox.style.display = 'none';
}));