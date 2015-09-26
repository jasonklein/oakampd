class VenuesController < ApplicationController

  before_filter :authenticate_user!, except: :index
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @venue.save
      redirect_to venues_path, notice: "Venue added."
    else
      render "new"
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        format.html { redirect_to venues_path, :notice => 'Venue was successfully updated.' }
        format.json { respond_with_bip @venue }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@venue) }
      end
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, notice: "Venue deleted."
  end

  private

  def venue_params
    params.require(:venue).permit(:address, :name, :phone, :url, :zipcode)
  end
end
