module DefaultUrlHelper
  DEFAULT_URL = "https://avatars3.githubusercontent.com/u/8669803?v=2&s=400"
  def default_image(image_url)
    if image_url.present?
      url
    else
      DEFAULT_URL
    end
  end
end
