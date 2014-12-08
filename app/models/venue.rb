class Venue < ActiveRecord::Base
  attr_accessible :address, :name, :zipcode

  validates :name, :address, :zipcode, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [name, address, "California", zipcode].compact.join(",")
  end
end
