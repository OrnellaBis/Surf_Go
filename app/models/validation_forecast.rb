class ValidationForecast < ApplicationRecord
  belongs_to :forecast
  belongs_to :user

  validates_uniqueness_of :forecast, scope: [:user_id]
  
end
