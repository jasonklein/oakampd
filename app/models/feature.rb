class Feature < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author, class_name: 'User'

  has_many :feature_images, dependent: :destroy
  accepts_nested_attributes_for :feature_images, allow_destroy: true

  validates :title, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :slug, presence: true

  attr_writer :cover_image, :other_images

  default_scope { order updated_at: :desc }
  scope :published, -> { where published: true }
  scope :unpublished, -> { where.not published: true }

  def cover_image
    feature_images.find_by_cover(true) || feature_images.order(:id).first
  end

  def cover_image_url(version = nil)
    cover_image.image.url version
  end

  def display_date
    updated_at.strftime '%B  %-d, %Y'
  end

  def display_title
    published ? title : "Draft: #{title}"
  end

  def other_images_urls
    return unless cover_image
    images = feature_images.where(cover: false).where('id != ?', cover_image.id).order(:id)
    images.map { |i| i.image.url }
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def self.latest
    Feature.published.where('updated_at > ?', 1.week.ago).first ||
    Feature.published.where('updated_at > ?', 1.month.ago).sample
  end
end
