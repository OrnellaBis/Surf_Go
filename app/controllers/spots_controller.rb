class SpotsController < ApplicationController
  def show
    @spot = Spot.find(params[:id])
    @forecast = Forecast.where(spot: @spot)
    @user = current_user
  end
end
