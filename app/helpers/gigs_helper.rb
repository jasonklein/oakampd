module GigsHelper

  def display_month(gig)
    date = gig.showdate
    month = date.strftime "%B"

    ### Returns "JUN" for "June" and "OCT" for "October"
    month[0..2].upcase
  end

  ### Comment out display_showdate method in favor of model method for
  ### use with best_in_place

  # def display_showdate(gig)
  #   date = gig.showdate
  #   day_word = date.strftime "%^a"

  #   raw "<div class='gig-month'>#{display_month(gig)}</div><div class='day-word'>#{day_word}</div><div class='day-number'>#{date.day}</div>"
  # end

  def display_venue_details(gig)
    "#{gig.venue_name}—#{gig.venue_address}"
  end

  ### Comment out display_price method in favor of model method for
  ### use with best_in_place

  # def display_price(gig)
  #   if gig.price && gig.price > 0
  #     number_with_precision gig.price, precision: 2
  #   elsif gig.price < 0
  #     "TBA"
  #   else
  #     0
  #   end
  # end

  def last_of_the_month?(gig_id, last_ids)
    last_ids.include? gig_id
  end

  def showdate_has_passed?(gig)
    gig.showdate < Time.current.to_date
  end

  def gig_listing_classes(gig, last_ids, index, ads)
    classes_array = []
    if last_of_the_month? gig.id, last_ids
      classes_array << "last-of-the-month"
    end

    # if proper_index_and_mobile_and_ads?(index, ads)
    #   classes_array << "has-ad"
    # end

    if showdate_has_passed? gig
      classes_array << "past-showdate"
    end

    classes_array.join " "
  end

  def proper_index_and_mobile_and_ads?(index, ads)
    (index > 0) && (index % 15 == 0) && ads.any?
  end

  def display_ad_if_proper_index_and_mobile(index, ads)
    if proper_index_and_mobile_and_ads?(index, ads)
      ad_parts = ads.sample
      @ads = ads.reject { |ad| ad == ad_parts}
      render partial: "layouts/mobile_ad", locals: {ad_image: ad_parts[0], ad_url: ad_parts[1]}
    else
      return
    end
  end


end



