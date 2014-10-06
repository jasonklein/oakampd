module ApplicationHelper
  def display_header_image
    if params[:controller] == "gigs" && params[:action] == "index"
      image_tag "oakampd-header-black.png"
    else
      link_to image_tag("oakampd-header-black.png"), root_path
    end
  end
end
