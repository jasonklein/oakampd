class BandsController < ApplicationController

  before_filter :authenticate_user!, except: :bandwatch
  load_and_authorize_resource except: :bandwatch

  def bandwatch
    @bands = Band.all
  end

  def new
  end

  def create
    @band = Band.new params[:band]
    if @band.save
      redirect_to bandwatch_path, notice: "Band added!"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @band.update_attributes params[:band]
      redirect_to bandwatch_path, notice: "Band updated!"
    else
      render "edit"
    end
  end

  def destroy
    @band.destroy
    redirect_to root_path, notice: "Band deleted."
  end


end
