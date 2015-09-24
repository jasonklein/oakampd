class FeaturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    binding.pry
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
