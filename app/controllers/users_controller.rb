class UsersController < ApplicationController

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to spot_path(params[:user][:spot_id])
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:air_temperature, :cloud_cover, :current_direction, :current_speed, :swell_direction, :swell_height, :water_temperature, :wave_direction, :wave_height, :wave_period, :wind_wave_height, :wind_direction, :wind_speed, :gust, :precipitation, :uv_index)
  end
end
