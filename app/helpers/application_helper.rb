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
end
