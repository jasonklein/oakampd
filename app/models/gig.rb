class Gig < ActiveRecord::Base

  default_scope order("showdate ASC")

  def display_showdate
    if self.showdate
      date = self.showdate
      month = date.strftime "%B"
      ### Set display_month to "JUN" for "June" and "OCT" for "October"
      display_month = month[0..2].upcase
      day_word = date.strftime "%^a"
      html = "<div class='gig-month'>#{display_month}</div><div class='day-word'>#{day_word}</div><div class='day-number'>#{date.day}</div>"
    else
      html = "<div class='day-word'>TBA</div>"
    end
    html.html_safe
  end

  def band_upcase
    self.band ? self.band.upcase : "TBA"
  end

  def display_venue
    self.venue_name ? self.venue_name : "TBA"
  end

  def display_price
    if self.price && self.price > 0
      '%.2f' % self.price
    elsif (self.price && self.price < 0) || !self.price
      "TBA"
    else
      "FREE"
    end
  end

end
