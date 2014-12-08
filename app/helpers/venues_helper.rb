module VenuesHelper

  def display_name(venue)
    if venue.url
      render partial: "venues/listing_name_w_url", locals: {name: venue.name, url: venue.url}
    else
      render partial: "venues/listing_name_wo_url", locals: {name: venue.name}
    end
  end

  def display_phone_if_present(venue)
    render(partial: "venues/listing_phone", locals: {phone: venue.phone}) if venue.phone
  end

  def stripped_phone(phone)
    phone.gsub(/[-.()]/, '')
  end

end
