const fetchMethode = () => {
    const lat = 43.69;
    const lng = -1.37;
    const params = 'windSpeed,windDirection,airTemperature,airTemperature1000hpa,waveDirection,windWaveDirection,waveHeight,windWaveHeight,windWaveHeight,windWavePeriod,wavePeriod';
    const paramsUV = 'uvIndex';
    
    
    fetch(`https://api.stormglass.io/v2/weather/point?lat=${lat}&lng=${lng}&params=${params}`, {
      headers: {
        'Authorization': ''
      }
    })
      .then((response) => response.json())
      .then((jsonData) => {
        // Do something with response data.
        console.log(jsonData)
      });

      

    fetch(`https://api.stormglass.io/v2/solar/point?lat=${lat}&lng=${lng}&params=${paramsUV}`, {
      headers: {
        'Authorization': ''
      }
    })
      .then((response) => response.json())
      .then((jsonData) => {
        // Do something with response data.
        console.log(jsonData)
      });

}

export {fetchMethode};