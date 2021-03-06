# app/helpers/meta_tags_helper.rb

module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # ajoutez la ligne ci-dessous pour que le helper fonctionne indifféremment
    # avec une image dans vos assets ou une url absolue
    meta_image.starts_with?("http") ? meta_image : image_url(asset_path("Growth-marketing.png"))
  end

  def meta_robots
    content_for?(:meta_robots) ? content_for(:meta_robots) : DEFAULT_META["meta_robots"]
  end
end
