class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  before_action :set_units, :set_label_forecast, only: [:index, :show]

  def index
    @user= current_user
    if params[:query].present?
      @user_input = params[:query]
      if @user_input.capitalize == "Hossegor"
        @user_input="Soorts-hossegor"
      end
      city_lat_long = Geocoder.search(@user_input).first.coordinates
      @spots = Spot.near([city_lat_long[0], city_lat_long[1]], 10)
      # @spots.each do |spot|
      #   forecast = Forecast.find_by(spot: spot, time: DateTime.now.in_time_zone('UTC').beginning_of_hour)
      #   @conditions = surffing_condition(forecast)
      # end
    else
      @spots = Spot.all
    end

    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        # image_url: ('images/planche')
        image_url: helpers.asset_url('planche.png')
      }
    end

  end

  def show
    @spot = Spot.find(params[:id])
    @user = current_user
    @forecast = @spot.current_forecast
    @current_date = DateTime.now.to_date
    @validate = @forecast.is_validate?
    if params[:date]
      datetime = DateTime.now + params[:date].to_i
      @current_date = datetime.to_date
      @forecast = Forecast.find_by(spot: @spot, time: datetime.in_time_zone('UTC').beginning_of_hour)
      @validate = @forecast.is_validate?
    end
    @actual_hour = DateTime.now.hour
    @current_hour = DateTime.now.hour
    if params[:time]
      @forecast = Forecast.find_by(spot: @spot, time: DateTime.now.change({ hour: params[:time].to_i }).in_time_zone('UTC').beginning_of_hour)
      @current_hour = params[:time].to_i
      @validate = @forecast.is_validate?
    end
    if params[:date] && params[:time]
      datetime = DateTime.now + params[:date].to_i
      @current_date = datetime.to_date
      @forecast = Forecast.find_by(spot: @spot, time: datetime.change({ hour: params[:time].to_i }).in_time_zone('UTC').beginning_of_hour)
      @validate = @forecast.is_validate?
    end
    @air_temperature = @forecast.air_temperature
    @cloud_cover = @forecast.cloud_cover
    @wave_height = @forecast.wave_height

    @minimal_forecats = [@air_temperature, @cloud_cover, @wave_height]


    @all_forecast = @forecast.all_attributes

    @conditions = @forecast.surfing_condition

  end

  private

  def set_units

    @units = Forecast::UNITS
  end

  def set_label_forecast
    @label_forecast = Forecast::LABEL_FORECAST
  end

end
