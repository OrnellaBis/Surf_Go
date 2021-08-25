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

user = User.create(first_name: "Brice", last_name:"De Nice", email:"surfT@mer.com", password: "coucou")
spot_1 = Spot.create(city_name:"Hossegor", latitude:43.69, longitude:-1.37)
spot_2 = Spot.create(city_name:"Moliets-et-Maa", latitude:43.85, longitude:-1.35)
spot_3 = Spot.create(city_name:"Hendaye", latitude:43.3667, longitude:-1.7833)
fav_spot_1 = FavoriteSpot.create(spot: spot_1, user: user)
fav_spot_2 = FavoriteSpot.create(spot: spot_2, user: user)
forecast_1 = Forecast.create(air_temperature:25,cloud_cover:0, current_direction:349, current_speed:25, swell_direction:350,
                            swell_height:0.9, water_temperature:19, wave_direction:359, wave_height:40, wave_period:9, wind_wave_height:0.9,
                            wind_direction:27, wind_speed:60, gust:40, precipitation:0.1, uv_index:0.8, spot: spot_1)
forecast_2 = Forecast.create(air_temperature:35,cloud_cover:30, current_direction:39, current_speed:35, swell_direction:330,
                            swell_height:3.9, water_temperature:13, wave_direction:339, wave_height:1.4, wave_period:9, wind_wave_height:0.11,
                            wind_direction:37, wind_speed:30, gust:10, precipitation:0.3, uv_index:0.3, spot: spot_2)
forecast_3 = Forecast.create(air_temperature:15,cloud_cover:70, current_direction:10, current_speed:3, swell_direction:30,
                            swell_height:2, water_temperature:22, wave_direction:39, wave_height:1, wave_period:11, wind_wave_height:0.01,
                            wind_direction:67, wind_speed:0, gust:10, precipitation:0, uv_index:0.3, spot: spot_3)

