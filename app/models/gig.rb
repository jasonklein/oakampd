class Gig < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue
  attr_accessible :price, :showdate, :url, :band_id, :venue_id
end
