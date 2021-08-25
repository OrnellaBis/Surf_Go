class SpotsController < ApplicationController
  def index
    if params[:query].present?
      @spots = Spot.search_by_city(params[:query])
    else
      @spots = Spot.all
    end
  end

  def show
    # utiliser la même technique de recherche
    # récupérer le premier (ou le seul) élément de l'array qui est renvoyé, et le display
    # @spot = @spots.first
  end
end
