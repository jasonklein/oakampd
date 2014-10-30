class Gig < ActiveRecord::Base
  attr_accessible :price, :showdate, :url, :band, :venue_name, :venue_address

  default_scope order("showdate ASC")

  def band_upcase
    self.band.upcase
  end

end
