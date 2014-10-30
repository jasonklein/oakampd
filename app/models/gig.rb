class Gig < ActiveRecord::Base
  attr_accessible :price, :showdate, :url, :band, :venue_name, :venue_address

  default_scope order("showdate ASC")

  def display_showdate
    date = self.showdate
    month = date.strftime "%B"
    ### Set display_month to "JUN" for "June" and "OCT" for "October"
    display_month = month[0..2].upcase
    day_word = date.strftime "%^a"
    html = "<div class='gig-month'>#{display_month}</div><div class='day-word'>#{day_word}</div><div class='day-number'>#{date.day}</div>"
    html.html_safe
  end

  def band_upcase
    self.band.upcase
  end

  def display_price
    if self.price && self.price > 0
      '%.2f' % self.price
    elsif self.price < 0
      "TBA"
    else
      0
    end
  end



end
