class FeaturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource find_by: :slug
  skip_load_resource only: :index

  def index
    @published_features = Feature.published
    @draft_features = Feature.unpublished if current_user
  end

  def new
  end

  def create
    set_published_status
    set_author
    return render :new unless @feature.save
    set_feature_images(params[:feature][:cover_image], params[:feature][:other_images])
    redirect_to feature_path @feature
  end

  def show
  end

  def edit
  end

  def update
    set_published_status
    set_author
    return render :edit unless @feature.update feature_params
    set_feature_images(params[:feature][:cover_image], params[:feature][:other_images])
    redirect_to feature_path @feature
  end

  def destroy
    @feature.destroy
    redirect_to features_path, notice: "Feature deleted."
  end

  private

  def feature_params
    params.require(:feature).permit(:body, :cover_image, :display_subtitle, :other_images, :subtitle, :title, feature_images_attributes: [:_destroy, :cover, :feature_id, :id, :image])
  end

  def set_author
    @feature.author = current_user
  end

  def set_published_status
    @feature.published = params[:publish] == 'true' ? true : false if params[:publish]
  end

  def set_feature_images(new_cover_image, other_images)
    set_cover_image(new_cover_image) if new_cover_image
    set_other_images(other_images) if other_images.present?
  end

  def set_cover_image(new_cover_image)
    cover_image = @feature.feature_images.new(image: new_cover_image, cover: true)

    @feature.cover_image.update(cover: false) if @feature.cover_image
    cover_image.save    
  end

  def set_other_images(other_images)
    other_images.each do |i|
      @feature.feature_images.create image: i
    end
  end
end
