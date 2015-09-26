class FeaturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    @feature = Feature.new params[:feature]
    return render :new unless @feature.save
    # new_cover_image = params[:feature].delete :cover_image
    # other_images = params[:feature].delete :other_images
    set_feature_images(params[:feature][:cover_image], params[:feature][:other_images])
    redirect_to feature_path @feature
  end

  def show
  end

  def edit
  end

  def update
    return render :edit unless @feature.update_attributes params[:feature]
    set_feature_images(params[:feature][:cover_image], params[:feature][:other_images])
    redirect_to feature_path @feature
  end

  def destroy
  end

  private

  def set_feature_images(new_cover_image, other_images)
    set_cover_image(new_cover_image) if new_cover_image
    set_other_images(other_images) if other_images.present?
  end

  def set_cover_image(new_cover_image)
    cover_image = @feature.feature_images.new image: new_cover_image, cover: true

    @feature.cover_image.update_attributes(cover: false) if @feature.cover_image
    cover_image.save    
  end

  def set_other_images(other_images)
    other_images.each do |i|
      @feature.feature_images.create image: i
    end
  end
end
