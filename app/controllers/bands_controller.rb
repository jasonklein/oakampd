class BandsController < ApplicationController

  before_filter :authenticate_user!, except: :bandwatch
  load_and_authorize_resource except: :bandwatch

  def bandwatch
    if params[:tag] && params[:tag] != "all" 
      @bands = Band.tagged(params[:tag])
    else
      @bands = Band.all
    end

    @tags = Tag.with_bands.uniq

    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
  end

  def create
    tag_names = params[:tags].split.map(&:downcase).uniq 
    @band.add_tags tag_names

    # @band = Band.new params[:band]
    if @band.save
      redirect_to bandwatch_path, notice: "Band added!"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    tag_names = params[:tags].split.map(&:downcase).uniq 
    @band.add_tags tag_names

    if @band.update band_params
      redirect_to bandwatch_path, notice: "Band updated!"
    else
      render "edit"
    end
  end

  def destroy
    @band.destroy
    redirect_to bandwatch_path, notice: "Band deleted."
  end

  private

  def band_params
    params.require(:band).permit(:bandcamp, :facebook, :image, :image_credit, :name, :soundcloud, :website, :remote_image_url)
  end
end
