class Forecast < ApplicationRecord
  belongs_to :spot
  has_many :validation_forcasts

end
