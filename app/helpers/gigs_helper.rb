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
end



