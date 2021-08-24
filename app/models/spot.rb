class Spot < ApplicationRecord
    has_many :favorite_spots
    has_many :forecast
end
