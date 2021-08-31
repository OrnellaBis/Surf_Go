class Spot < ApplicationRecord
    has_many :favorite_spots
    has_many :forecast

    # include PgSearch::Model
    # pg_search_scope :search_by_city,
    # #   against: [ :city_name]

    def liked?(user)
      !FavoriteSpot.where(user: user, spot: self).empty?
    end

    def current_forecast
      Forecast.find_by(spot: self, time: DateTime.now.in_time_zone('UTC').beginning_of_hour)
    end
    def validated?(user)
      ValidationForecast.find_by(user: user, forecast: current_forecast).present?
    end
    

  geocoded_by :city_name
end
