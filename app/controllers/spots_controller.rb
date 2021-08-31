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
    @forecast = Forecast.find_by(spot: @spot, time: DateTime.now.in_time_zone('UTC').beginning_of_hour)
    @current_date = DateTime.now.to_date
    if params[:date]
      datetime = DateTime.now + params[:date].to_i
      @current_date = datetime.to_date
      @forecast = Forecast.find_by(spot: @spot, time: datetime.in_time_zone('UTC').beginning_of_hour)
    end
    @actual_hour = DateTime.now.hour
    @current_hour = DateTime.now.hour
    if params[:time]
      @forecast = Forecast.find_by(spot: @spot, time: DateTime.now.change({ hour: params[:time].to_i }).in_time_zone('UTC').beginning_of_hour)
      @current_hour = params[:time].to_i
    end
    if params[:date] && params[:time]
      datetime = DateTime.now + params[:date].to_i
      @current_date = datetime.to_date
      @forecast = Forecast.find_by(spot: @spot, time: datetime.change({ hour: params[:time].to_i }).in_time_zone('UTC').beginning_of_hour)
    end
    @air_temperature = @forecast.air_temperature
    @cloud_cover = @forecast.cloud_cover
    @wave_height = @forecast.wave_height

    @minimal_forecats = [@air_temperature, @cloud_cover, @wave_height]

    @all_forecast =
      {
      current_direction: @forecast.current_direction,
      current_speed: @forecast.current_speed,
      swell_direction:@forecast.swell_direction,
      swell_height: @forecast.swell_height,
      water_temperature: @forecast.water_temperature,
      wave_direction: @forecast.wave_direction,
      wave_period: @forecast.wave_period,
      wind_wave_height: @forecast.wind_wave_height,
      wind_direction: @forecast.wind_direction,
      wind_speed: @forecast.wind_speed,
      gust: @forecast.gust,
      precipitation: @forecast.precipitation,
      uv_index: @forecast.uv_index
    }
    @conditions = surffing_condition(@all_forecast)
  end

  private

  def surffing_condition(forecasts)
    mark = 0
    forecasts.each do |key, value|
      if key.to_s.include?("wind_direction")
        if (value > 30 && value < 120)
          mark += 5
        elsif (value > 180 && value < 360)
          mark -= 5
        end

      end
      if key.to_s.include?("speed")
        if key.to_s.include?("wind")
          if (value < 3)
            mark += 5
          elsif value > 4
            mark -= 2
          end
        end
        #ajouter les données de courent
      end
      if key.to_s.include?("wave_height")
        if(value > 2)
          mark += 10
        elsif (value > 1)
          mark += 5
        elsif (value > 0.3)
          mark += 1
        end
      end
      if key.to_s.include?("periode")
        if value > 11 && value <= 12
          mark -= 1
        elsif value > 8 && value <= 12
          mark += 3
        elsif value > 3 && value <= 12
          mark -= 2
        end

      end
    end

    if mark > 15
      return ["Sors ta planche, les vagues ici, c'est l'avalanche !", "THE spot to be, c'est la folie !"].sample
    elsif mark >= 10
      return ["Des vagues en prévision, c'est le moment d'une petite session", "Les vagues sont cool, va y'avoir foule"].sample
    elsif mark < 10
      return ["Pas top today, mais pour le paddle c'est pt'être ok", "Pas masse de vagues, essaye la drague"].sample
    end
  end

  def set_units
    @units = {
      current_direction: "Direction du courant",
      current_speed: "m/s",
      swell_direction: "Direction de la houle",
      swell_height: "m",
      water_temperature: "°C",
      wave_direction: "Direction des vagues",
      wave_period: "s",
      wind_wave_height: "m",
      wind_direction: "Direction du vent",
      wind_speed: "m/s",
      gust: "m/s",
      precipitation: "Précipitations",
      uv_index: "Index UV",
    }
  end

  def set_label_forecast

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
  end

end
