class Band < ActiveRecord::Base
  attr_accessible :bandcamp, :facebook, :image, :image_credit, :name, :soundcloud, :website, :remote_image_url

  mount_uploader :image, BandImageUploader

  has_many :tags, through: :bands

  default_scope { order('name ASC') }

  def self.tagged(name)
    Tag.find_by_name(name).bands
  end
end
