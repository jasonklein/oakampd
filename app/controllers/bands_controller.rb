class BandsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @bands = Band.all
    render "bandwatch"
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

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @band.update_attributes(params[:band])
        format.html { redirect_to bandwatch_path, :notice => "Band was successfully updated." }
        format.json { respond_with_bip @band }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@band) }
      end
    end
  end

  def destroy
    @band.destroy
    redirect_to root_path, notice: "Band deleted."
  end


end
