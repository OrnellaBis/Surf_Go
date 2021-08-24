# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Forecast.destroy_all
Spot.destroy_all
FavoriteSpot.destroy_all

user = User.create(first_name: "Béné", last_name:"SurfTaMer", email:"surfT@mer.com", password: "coucou")
forecast_1 = Forecast.create(air_temperature:25,cloud_cover:0, current_direction:349, current_speed:25, swell_direction:350
                            swell_height:0.9, water_temperature:19, wave_direction:359, wave_height:40, wave_period:9, wind_wave_height:0.9
                            wind_direction:27, wind_speed:60, gust:40, precipitation:0.1, UV_index:0.8)
forecast_2 = Forecast.create(air_temperature:35,cloud_cover:30, current_direction:39, current_speed:35, swell_direction:330
                            swell_height:3.9, water_temperature:13, wave_direction:339, wave_height:1.4, wave_period:9, wind_wave_height:0.01
                            wind_direction:37, wind_speed:30, gust:10, precipitation:0.3, UV_index:0.3)