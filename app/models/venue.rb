class Venue < ActiveRecord::Base
  attr_accessible :address, :name, :zipcode

  validates :name, :address, :zipcode, presence: true
end
