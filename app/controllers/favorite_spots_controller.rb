class FavoriteSpotsController < ApplicationController
  def index
    @favoritespots = FavoriteSpot.all
  end

  def create
    @user = current_user
    @spot = Spot.find(params[:spot_id])
    @favoritespot = FavoriteSpot.new(user: @user, spot: @spot)
    if @favoritespot.save
      redirect_to spot_path(@spot)
    end
  end

  def destroy
    @favoritespot = FavoriteSpot.find(params[:id])
    @favoritespot.destroy
    redirect_to favorite_spots_path
  end

end
