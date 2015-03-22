module BandsHelper

  def display_text_field_with_tags_if_any(band)
    if band.tags.any?
      tags_for_field = band.tags.map(&:title).join(' ')
      # band.tags.each do |tag|
      #   tags_for_field << tag.title
      # end
      # tags_for_field = tags_for_field.join(', ')
      text_field_tag 'tags', nil, value: tags_for_field
    else
      text_field_tag 'tags', nil
    end
  end

end
