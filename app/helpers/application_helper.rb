module ApplicationHelper
  def display_header_image
    if params[:controller] == "gigs" && params[:action] == "index"
      image_tag logo_filename
    else
      link_to image_tag(logo_filename), root_path
    end
  end

  def logo_filename
    "oak-ampd-logo-bordered.jpg"
  end

  def favicon_filename
    "oak-ampd-favicon.ico"
  end

  def active_if_active(view)
    controller = params[:controller]
    if controller == "gigs" && view == "gigs"
      "active"
    else
      if controller == "high_voltage/pages"
        "active" if params[:id] == view
      end
    end
  end

  def form_label_with_backing(label)
    case label
    when :showdate
      raw "<span class='backing'>Showdate (YY-MM-DD)</span>"
    when :url
      raw "<span class='backing'>URL</span>"
    else
      raw "<span class='backing'>#{label.capitalize}</span>"
    end
  end

  def in_production?
    Rails.env.production?
  end

  def venues_controller?
    params[:controller] == "venues"
  end

end
