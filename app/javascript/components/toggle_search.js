const toggleSearch = () => {
  const searchIcon = document.querySelector(".search-getter");
  const searchBar = document.querySelector(".search");
  const iconList = document.querySelector(".list-inline");
  searchIcon.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
    searchBar.style.display = 'block';
    iconList.style.display = 'none';
  });
  const mainWrapper = document.querySelector(".main-wrapper");
  mainWrapper.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
    searchBar.style.display = 'none';
    iconList.style.display = 'flex';
    // je remove la classe active sur navbar-down
  })



  // Si je clique
  // 1. Je selectionne l'element #search-getter
  // 2. J'ecoute le clic sur cet element
  // 3. Je selectionne l'element .navbar-down
  // 4. Je toggle la classe "active"
}

export { toggleSearch };
