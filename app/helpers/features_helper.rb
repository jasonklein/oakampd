module FeaturesHelper
  def cover_image_for_index(feature)
    feature.cover_image ? feature.cover_image_url(:thumb) : 'oak-ampd-cover-image.jpg'
  end
end
