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

  def destroy
  end
end
