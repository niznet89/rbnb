class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @artworks = policy_scope(Artwork)
    if params[:query].present?
      @results = PgSearch.multisearch(params[:query])
    else
      @artworks = Artwork.all
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user

    if @artwork.save
      redirect_to artwork_path(@artwork), notice: 'Good job! A new artwork was successfully created!'
    else
      render :new
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :category, :photo)
  end
end
