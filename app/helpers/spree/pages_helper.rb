module Spree
  module PagesHelper
    def featured_image_tag(page, size:, **options)
      if page.image.nil?
        ""
      else
        attachment = page.image.attachment
        url = attachment.url(size)
        tag('img', src: url, **options)
      end
    end
  end
end