class Venue < ActiveRecord::Base
  attr_accessible :name, :street_address, :zipcode

  has_many :gigs
  has_many :bands, through: :gigs
end
