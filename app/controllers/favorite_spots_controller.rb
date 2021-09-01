class FavoriteSpotsController < ApplicationController
  def index
    @favoritespots = FavoriteSpot.all.includes(:spot)
  end

  def create
    @user = current_user
    @spot = Spot.find(params[:spot_id])
    @favoritespot = FavoriteSpot.find_by(user: @user, spot: @spot)

    if @favoritespot
      @favoritespot.destroy
    else
      @favoritespot = FavoriteSpot.create(user: @user, spot: @spot)
    end

    respond_to do |format|
      format.json { render json: { liked: !FavoriteSpot.find_by(user: @user, spot: @spot).nil? } }
      format.html {redirect_to spot_path(@spot) }
    end
  end

  def destroy
    @favoritespot = FavoriteSpot.find(params[:id])
    @favoritespot.destroy
    redirect_to favorite_spots_path
  end

end
