class FeatureImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :feature
end
