class Forecast < ApplicationRecord
  belongs_to :spot
  has_many :validation_forecasts

  def is_validate?
    if self.validation_forecasts.size >= 5
      return true
    else
      return false
    end
  end
  
end
