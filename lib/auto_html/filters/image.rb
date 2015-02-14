require 'tag_helper'

module AutoHtml
  class Image < Filter
    def call(text)
      alt = options[:alt] || ''
      proxy = options[:proxy] || ''
      text.gsub(/(?<!src=")https?:\/\/.+?\.(jpg|jpeg|bmp|gif|png)(\?\S+)?/i) do |match|
        TagHelper.image_tag(proxy + match, :alt => alt)
      end
    end
  end
end
