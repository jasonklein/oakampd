class Band < ActiveRecord::Base
  attr_accessible :name

  has_many :gigs
  has_many :venues, through: :gigs
end
