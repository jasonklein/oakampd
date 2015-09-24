class FeatureImage < ActiveRecord::Base
  attr_accessible :image

  mount_uploader :image, ImageUploader

  belongs_to :feature
end
