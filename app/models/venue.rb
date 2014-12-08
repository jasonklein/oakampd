class Venue < ActiveRecord::Base
  attr_accessible :address, :name, :zipcode, :phone, :url

  validates :name, :address, :zipcode, presence: true
  validates :phone, numericality: {only_integer: true}, allow_nil: true

  geocoded_by :full_address
  after_validation :geocode

  default_scope order("name ASC")

  def full_address
    [name, address, "California", zipcode].compact.join(",")
  end
end
