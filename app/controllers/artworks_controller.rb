class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show ]

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
      redirect_to edit_profile_path(current_user), notice: 'Good job! A new artwork was successfully created!'
    else
      render :new
    end
    authorize @artwork
  end

  def digital_art
    authorize Artwork
    @artworks = Artwork.where(category: 'digital art')
  end

  def paintings
    @artworks = Artwork.where(category: 'painting')
    authorize Artwork
  end

  def sculptures
    @artworks = Artwork.where(category: 'sculpture')
    authorize Artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :category, :photo)
  end
end
