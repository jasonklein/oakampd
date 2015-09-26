class FeatureImage < ActiveRecord::Base
  attr_accessible :cover, :feature_id, :image

  mount_uploader :image, ImageUploader

  belongs_to :feature
end
