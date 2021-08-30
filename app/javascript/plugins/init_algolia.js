const initAlgolia = () => {
  const places = require('places.js');
  const placesAutocomplete = places({
    container: document.querySelector('#query')
  });
}

export {initAlgolia};
