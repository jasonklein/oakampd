module GigsHelper
  def showdate_for_gig(ids, gig)
    if ids.include? gig.id
      render partial: "first_of_the_month", locals: {gig: gig}
    else
      gig.showdate.day
    end
  end

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
end



