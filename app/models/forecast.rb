class Forecast < ApplicationRecord
  belongs_to :spot
  has_many :validation_forecasts

  UNITS = {
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
      precipitation: "kg/m2",
      uv_index: "Index UV",
    }

    LABEL_FORECAST = {
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

  def is_validate?
    self.validation_forecasts.size >= 5
  end

  def all_attributes
    {
      current_direction: current_direction,
      current_speed: current_speed,
      swell_direction:swell_direction,
      swell_height: swell_height,
      water_temperature: water_temperature,
      wave_direction: wave_direction,
      wave_period: wave_period,
      wave_height: wave_height,
      wind_wave_height: wind_wave_height,
      wind_direction: wind_direction,
      wind_speed: wind_speed,
      gust: gust,
      precipitation: precipitation,
    }
  end

  def surfing_condition
    mark = 0
    all_attributes.each do |key, value|
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
        #ajouter les données de courant
      end
      if key.to_s == "wave_height"
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
      return ["Pas de vagues today, mais pour le paddle c'est peut-être ok", "Mer d'huile, c'est la tuile"].sample
    end
  end
end
