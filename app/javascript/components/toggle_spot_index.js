const toggleSpot = () => {
  const chevron = document.querySelector(".card-list-header");
  if (chevron) {
    const cardList = document.querySelector(".card-list");
    chevron.addEventListener("click", (event) => {
      if (cardList.classList.contains("open")) {
        cardList.classList.remove("open")
      } else {
        cardList.classList.add("open")
      }
    })
  }
}

export { toggleSpot }
