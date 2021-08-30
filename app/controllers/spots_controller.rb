class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @user= current_user
    if params[:query].present?
      @user_input = params[:query]
      if @user_input.capitalize == "Hossegor"
        @user_input="Soorts-hossegor"
      end
      city_lat_long = Geocoder.search(@user_input).first.coordinates
      @spots = Spot.near([city_lat_long[0], city_lat_long[1]], 10)
    else
      @spots = Spot.all
    end

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @user = current_user
    @forecasts = Forecast.where(spot_id: @spot.id)
raise
    @air_temperature = @forecast.air_temperature
    @cloud_cover = @forecast.cloud_cover
    @current_direction = @forecast.current_direction
    @current_speed = @forecast.current_speed
    @swell_direction = @forecast.swell_direction
    @swell_height = @forecast.swell_height
    @water_temperature = @forecast.water_temperature
    @wave_direction = @forecast.wave_direction
    @wave_height = @forecast.wave_height
    @wave_period = @forecast.wave_period
    @wind_wave_height = @forecast.wind_wave_height
    @wind_direction = @forecast.wind_direction
    @wind_speed = @forecast.wind_speed
    @gust = @forecast.gust
    @precipitation = @forecast.precipitation
    @uv_index = @forecast.uv_index

    @minimal_forecats = [@air_temperature, @cloud_cover, @wave_height]
    @label_forecast = {
      current_direction: "Direction du courant",
      current_speed: "Vitesse du courant",
      swell_direction: "Direction de la houle",
      swell_height: "Hauteur de la houle",
      water_temperature: "Température de l'eau",
      wave_direction: "Direction des vagues",
      wave_period: "Période entre les vagues",
      wind_wave_height: "Hauteur des vagues en fonction du vent",
      wind_direction: "Direction du vent",
      wind_speed: "Vitesse des vents",
      gust: "Rafales",
      precipitation: "Précipitations",
      uv_index: "Index UV",
    }
    @all_forecast =
      {
      current_direction: @current_direction,
      current_speed: @current_speed,
      swell_direction: @swell_direction,
      swell_height: @swell_height,
      water_temperature: @water_temperature,
      wave_direction: @wave_direction,
      wave_period: @wave_period,
      wind_wave_height: @wind_wave_height,
      wind_direction: @wind_direction,
      wind_speed: @wind_speed,
      gust: @gust,
      precipitation: @precipitation,
      uv_index: @uv_index
    }

  end
end
