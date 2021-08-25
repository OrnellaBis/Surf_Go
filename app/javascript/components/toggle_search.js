const toggleSearch = () => {
  const searchBar = document.querySelector("#search-getter");
  searchBar.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
    console.log(searchBar);
  });
  const mainWrapper = document.querySelector(".main-wrapper");
  mainWrapper.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
    console.log(mainWrapper);
    // je remove la classe active sur navbar-down
  })



  // Si je clique
  // 1. Je selectionne l'element #search-getter
  // 2. J'ecoute le clic sur cet element
  // 3. Je selectionne l'element .navbar-down
  // 4. Je toggle la classe "active"
}

export { toggleSearch };
