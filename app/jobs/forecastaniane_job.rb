class ForecastanianeJob < ApplicationJob
  queue_as :default

  def perform(spot)
    puts "#{spot.city_name} going to be updated"
    api_response = RestClient.get('https://api.stormglass.io/v2/weather/point',
      headers={
        'Authorization': 'c4623262-049d-11ec-ad82-0242ac130002-c46232ee-049d-11ec-ad82-0242ac130002',
          params:
          {
            lat: spot.latitude,
            lng: spot.longitude,
            params: "airTemperature,cloudCover,currentDirection,currentSpeed,gust,precipitation,swellDirection,swellHeight,waterTemperature,waveDirection,waveHeight,windWaveHeight,windDirection,windSpeed,wavePeriod"
          }
      }
    )
    
    data_forecast = JSON.parse(api_response)
    spot.forecast.destroy_all
    num = 0
    data_forecast["hours"].first(72).each do |hour|
      num += 1
      air_temperature = hour["airTemperature"]["dwd"]
      cloud_cover =  hour["cloudCover"]["dwd"]
      current_direction = hour["currentDirection"]["meto"]
      current_speed = hour["currentSpeed"]["meto"]
      gust = hour["gust"]["dwd"]
      time = hour["time"].to_s.to_datetime
      precipitation = hour["precipitation"]["dwd"]
      swell_direction = hour["swellDirection"]["dwd"]
      swell_height = hour["swellHeight"]["dwd"]
      water_temperature = hour["waterTemperature"]["meto"]
      wave_direction = hour["waveDirection"]["meteo"]
      wave_height = hour["waveHeight"]["dwd"]
      wave_period = hour["wavePeriod"]["icon"]
      wind_wave_height = hour["windWaveHeight"]["dwd"]
      wind_direction = hour["windDirection"]["icon"]
      wind_speed = hour["windSpeed"]["icon"]
      forecast = Forecast.new(air_temperature: air_temperature,cloud_cover: cloud_cover, current_direction: current_direction, current_speed: current_speed, swell_direction: swell_direction,
                              swell_height: swell_height, water_temperature: water_temperature, wave_direction: wave_direction, wave_height: wave_height, wave_period: wave_period, wind_wave_height: wind_wave_height,
                              wind_direction: wind_direction, wind_speed: wind_speed, gust: gust, precipitation: precipitation, uv_index:0.8, spot: spot, time: time)
      forecast.save!
    end
    puts "all forecast for #{spot.city_name} have been saved"
  end

end
