module ApplicationHelper
  def display_header_image
    if params[:controller] == "gigs" && params[:action] == "index"
      image_tag logo_filename
    else
      link_to image_tag(logo_filename), root_path
    end
  end

  def logo_filename(placeholder=nil)
    placeholder ? "oak-ampd-logo-placeholder.jpg" : "oak-ampd-logo-bordered.jpg"
  end

  def logo_thumb
    "oak-ampd-logo-thumb.jpg"
  end

  def favicon_filename
    "oak-ampd-favicon.ico"
  end

  def active_if_active(view)
    controller = params[:controller]
    if controller == view
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
    when :image_credit
      raw "<span class='backing'>Image Credit</span>"
    else
      label_array = label.to_s.split("_")
      label = label_array.map(&:capitalize).join(" ")
      raw "<span class='backing'>#{label}</span>"
    end
  end

  def in_production?
    Rails.env.production?
  end

  def bandwatch_index?
    params[:controller] == "bands" && params[:action] == "bandwatch"
  end

  def meta_keywords
    "oakland gigs, oakland gig guide, oakland listings, oakland concerts, indie gigs oakland, oakland gigs tonight, oakland live music, oakland live, oakland live gigs, whats on music oakland, oakland music gigs, timeout oakland, oakland shows, oakland bands, oakland venues"
  end

  def content_for_header
    controller = params[:controller]
    content = Content.first
    if controller == "contents"
      return
    elsif controller == "devise/sessions"
      raw content.gigs_header
    else
      header = controller == "high_voltage/pages" ? content.about_header : content.send("#{controller}_header")
      raw header
    end
  end

  def content_for_about
    content = Content.first
    raw content.about_content
  end

  def features_controller?
    params[:controller] == 'features'
  end

  def default_meta
    {
      description: 'Your Oakland gig guide. Find information on live music gigs and shows, venues, and bands in Oakland, California.',
      image: asset_url(logo_thumb),
      title: 'Oak Ampd',
      url: root_url
    }
  end
end
