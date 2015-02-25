class Band < ActiveRecord::Base
  attr_accessible :bandcamp, :facebook, :image, :image_credit, :name, :soundcloud, :website, :remote_image_url

  mount_uploader :image, BandImageUploader

  default_scope { order('name ASC') }
end
