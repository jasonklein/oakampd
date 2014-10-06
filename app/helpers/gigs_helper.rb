module GigsHelper

  def display_month(gig)
    date = gig.showdate
    month = date.strftime "%B"

    ### Returns "JUNE" for June and "OCT" for October

    if month.length <= 4
      month.upcase
    else
      month[0..2].upcase
    end
  end

  def display_showdate(gig)
    date = gig.showdate
    day_word = date.strftime "%^a"

    raw "<div class='day-word'>#{day_word}</div><div class='day-number'>#{date.day}</div>"
  end

  def display_venue_details(gig)
    "#{gig.venue_name}—#{gig.venue_address}"
  end

  def display_price(gig)
    if gig.price && gig.price > 0
      number_to_currency gig.price
    else
      "Free"
    end
  end

end



