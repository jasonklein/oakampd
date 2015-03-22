class Tag < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true

  has_many :taggings, dependent: :destroy
  has_many :bands, through: :taggings

  scope :with_bands, joins(:taggings)

end
