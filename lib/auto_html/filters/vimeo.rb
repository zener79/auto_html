module AutoHtml
  class Vimeo < Filter

    def call(text)
      width  = options[:width] || 440
      height = options[:height] || 248
      frameborder = options[:frameborder] || 0
      show_title  = options[:show_title] ? nil : "title=0"
      show_byline = options[:show_byline] ? nil : "byline=0"
      show_portrait    = options[:show_portrait] ? nil : "portrait=0"
      allow_fullscreen = options[:allow_fullscreen] ? " webkitallowfullscreen mozallowfullscreen allowfullscreen" : nil

      text.gsub(/https?:\/\/(www.)?vimeo\.com\/([A-Za-z0-9._%-]*)((\?|#)\S+)?/) do
        vimeo_id = $2
        query_string_variables = [show_title, show_byline, show_portrait].compact.join("&")
        query_string    = "?" + query_string_variables unless query_string_variables.empty?

        %{<iframe src="//player.vimeo.com/video/#{vimeo_id}#{query_string}" width="#{width}" height="#{height}" frameborder="#{frameborder}"#{allow_fullscreen}></iframe>}
      end
    end

  end
end
