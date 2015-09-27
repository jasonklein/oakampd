module FeaturesHelper
  def feature_overview_subtitle(feature)
    subtitle = feature.display_subtitle && feature.subtitle ? feature.subtitle : feature.body
    return if subtitle.blank?
    length = feature.title.length
    return if feature.title.length > 70 && feature.cover_image
    return truncate(subtitle, length: 100 - feature.title.length, separator: ' ') if feature.cover_image
    truncate(subtitle, length: 70, separator: ' ')
  end
end
