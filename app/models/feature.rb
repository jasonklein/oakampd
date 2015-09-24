class Feature < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  attr_accessible :body, :subtitle, :title

  has_many :feature_images, dependent: :destroy
  accepts_nested_attributes_for :feature_images, allow_destroy: true

  def cover_image
    feature_images.first
  end

  def other_images
    feature_images[1..-1]
  end
end
