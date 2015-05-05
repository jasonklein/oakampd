class Content < ActiveRecord::Base
  attr_accessible :gigs_header, :venues_header, :bands_header, :about_header, :about_content
end
