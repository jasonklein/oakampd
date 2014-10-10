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

  def last_of_the_month?(gig_id, last_ids)
    last_ids.include? gig_id
  end

  def showdate_has_passed?(gig)
    gig.showdate < Date.today
  end

  def gig_listing_classes(gig, last_ids)
    classes_array = []
    if last_of_the_month? gig.id, last_ids
      classes_array << "last-of-the-month"
    end

    if showdate_has_passed? gig
      classes_array << "past-showdate"
    end

    classes_array.join " "
  end

end



