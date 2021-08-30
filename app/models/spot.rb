class Spot < ApplicationRecord
    has_many :favorite_spots
    has_many :forecast

    # include PgSearch::Model
    # pg_search_scope :search_by_city,
    # #   against: [ :city_name]

    def liked?(user)
      !FavoriteSpot.where(user: user, spot: self).empty?
    end

  geocoded_by :city_name
end
