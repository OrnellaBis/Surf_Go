class ValidationForecastsController < ApplicationController
    
    def create
        @user = current_user
        @forecast = Forecast.find(params[:forecast_id])
        @validation = ValidationForecast.new()
        @validation.forecast = @forecast
        @validation.user = @user
        if @validation.save!
        end
        
    end

    # private

    # def params_validation
    #     params.require(:validation_forecast).require
    # end
    
end
