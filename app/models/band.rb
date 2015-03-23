class Band < ActiveRecord::Base
  attr_accessible :bandcamp, :facebook, :image, :image_credit, :name, :soundcloud, :website, :remote_image_url

  mount_uploader :image, BandImageUploader

  validates :name, presence: true

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  default_scope { order('name ASC') }

  def self.tagged(name)
    Tag.find_by_name(name).try(:bands)
  end

  def add_tags(tag_names)
    self.tags = []
    tag_names.each do |tag_name|
      if !tag_name.blank?
        tag = Tag.where(name: tag_name).first_or_initialize
        self.tags << tag if tag.save!
      end
    end
    self.tags = self.tags.uniq
  end

end
