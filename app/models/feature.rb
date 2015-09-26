class Feature < ActiveRecord::Base
  attr_accessible :body, :cover_image, :display_subtitle, :feature_images_attributes, :other_images, :subtitle, :title

  belongs_to :author, class_name: 'User'

  has_many :feature_images, dependent: :destroy
  accepts_nested_attributes_for :feature_images, allow_destroy: true

  attr_writer :cover_image, :other_images

  def cover_image
    feature_images.find_by_cover(true) || feature_images.order(:id).first
  end

  def cover_image_url(version = nil)
    cover_image.image.url version
  end

  def other_images_urls
    return unless cover_image
    images = feature_images.where(cover: false).where('id != ?', cover_image.id).order(:id)
    images.map { |i| i.image.url }
  end
end
