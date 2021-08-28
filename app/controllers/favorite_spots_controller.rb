class FavoriteSpotsController < ApplicationController
  def index
    @favoritespots = FavoriteSpot.all
  end

  def create
    @user = current_user
    @spot = Spot.find(params[:spot_id])
    @favoritespot = FavoriteSpot.find_by(user: @user, spot: @spot)
    if @favoritespot
      @favoritespot.destroy
    else
      FavoriteSpot.create(user: @user, spot: @spot)
    end
    redirect_to request.referrer

  end

  def destroy
    @favoritespot = FavoriteSpot.find(params[:id])
    @favoritespot.destroy
    redirect_to favorite_spots_path
  end

end
