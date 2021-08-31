require 'json'
require 'open-uri'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FavoriteSpot.destroy_all
Forecast.destroy_all
User.destroy_all
Spot.destroy_all


filepath = 'db/spots.json'
serialized_spot = File.read(filepath)
data = JSON.parse(serialized_spot)

(40..70).each do |i|
  city_name = data["data"]["spots"][i]["name"]
  latitude = data["data"]["spots"][i]["lat"]
  longitude = data["data"]["spots"][i]["lon"]
  spot = Spot.new(city_name: city_name, longitude: longitude, latitude: latitude)
  spot.save!

  api_response = RestClient.get('https://api.stormglass.io/v2/weather/point',
    headers={
      'Authorization': 'c20261c8-096a-11ec-ab81-0242ac130002-c2026268-096a-11ec-ab81-0242ac130002',
        params:
        {
          lat: spot.latitude,
          lng: spot.longitude,
          params: "airTemperature,cloudCover,currentDirection,currentSpeed,gust,precipitation,swellDirection,swellHeight,waterTemperature,waveDirection,waveHeight,windWaveHeight,windDirection,windSpeed,wavePeriod"
        }
    }
  )

  data_forecast = JSON.parse(api_response)

 data_forecast["hours"].first(72).each do |hour|
  
  air_temperature = hour["airTemperature"]["dwd"]
  cloud_cover =  hour["cloudCover"]["dwd"]
  current_direction = hour["currentDirection"]["meteo"]
  current_speed = hour["currentSpeed"]["meteo"]
  gust = hour["gust"]["dwd"]
  time = hour["time"].to_s.to_datetime
  precipitation = hour["precipitation"]["dwd"]
  swell_direction = hour["swellDirection"]["dwd"]
  swell_height = hour["swellHeight"]["dwd"]
  water_temperature = hour["waterTemperature"]["meteo"]
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
end

user = User.create(first_name: "Brice", last_name:"De Nice", email:"surfT@mer.com", password: "coucou")


# spot_1 = Spot.create(city_name:"Hossegor", latitude:43.69, longitude:-1.37)
# spot_2 = Spot.create(city_name:"Moliets-et-Maa", latitude:43.85, longitude:-1.35)
# spot_3 = Spot.create(city_name:"Hendaye", latitude:43.3667, longitude:-1.7833)
# fav_spot_1 = FavoriteSpot.create(spot: spot_1, user: user)
# fav_spot_2 = FavoriteSpot.create(spot: spot_2, user: user)
# forecast_1 = Forecast.create(air_temperature:25,cloud_cover:0, current_direction:349, current_speed:25, swell_direction:350,
#                             swell_height:0.9, water_temperature:19, wave_direction:359, wave_height:40, wave_period:9, wind_wave_height:0.9,
#                             wind_direction:27, wind_speed:60, gust:40, precipitation:0.1, uv_index:0.8, spot: spot_1)
# forecast_2 = Forecast.create(air_temperature:35,cloud_cover:30, current_direction:39, current_speed:35, swell_direction:330,
#                             swell_height:3.9, water_temperature:13, wave_direction:339, wave_height:1.4, wave_period:9, wind_wave_height:0.11,
#                             wind_direction:37, wind_speed:30, gust:10, precipitation:0.3, uv_index:0.3, spot: spot_2)
# forecast_3 = Forecast.create(air_temperature:15,cloud_cover:70, current_direction:10, current_speed:3, swell_direction:30,
#                             swell_height:2, water_temperature:22, wave_direction:39, wave_height:1, wave_period:11, wind_wave_height:0.01,
#                             wind_direction:67, wind_speed:0, gust:10, precipitation:0, uv_index:0.3, spot: spot_3)



# puts data["data"]["spots"](40..70)["lat"]
# puts data["data"]["spots"][12]["lon"]
# puts data["data"]["spots"][12]["name"]

puts "Done!!"
