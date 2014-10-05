class Gig < ActiveRecord::Base
  belongs_to :band
  belongs_to :venue
  attr_accessible :price, :showdate, :url, :band_id, :venue_id

  default_scope order("showdate ASC")

  def band_name
    band.name
  end

  def venue_details
    "#{venue.name}—#{venue.street_address}"
  end
end
