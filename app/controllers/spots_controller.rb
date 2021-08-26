class SpotsController < ApplicationController
  def index
    if params[:query].present?
      @spots = Spot.search_by_city(params[:query])
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
    @forecast = Forecast.find_by(spot: @spot)

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
