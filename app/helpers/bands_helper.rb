module BandsHelper

  def display_text_field_with_tags_if_any(band)
    if band.tags.any?
      tags_for_field = band.tags.map(&:name).join(' ')
      text_field_tag 'tags', nil, value: tags_for_field
    else
      text_field_tag 'tags', nil
    end
  end

end
