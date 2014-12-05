class VenuesController < ApplicationController

  before_filter :authenticate_user!, except: :index
  load_and_authorize_resource

  def index
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
