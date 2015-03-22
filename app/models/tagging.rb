class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :band
  
  attr_accessible :name
end
