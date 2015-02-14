module AutoHtml
  class Ted < Filter

    def call(text)
      width  = options[:width]  || 640
      height = options[:height] || 360
      scrolling   = options[:scrolling]   || "no"
      frameborder = options[:frameborder] || 0
      allow_full_screen = options[:allow_full_screen] || false
      text.gsub(/https?:\/\/(www.|embed.)?ted\.com\/talks\/([A-Za-z0-9._%-]*)\.html((\?|#)\S+)?/) do
        ted_page = $2
        %{<iframe width="#{width}" height="#{height}" frameborder="#{frameborder}" scrolling="#{scrolling}" src="http://embed.ted.com/talks/#{ted_page}.html"#{allow_full_screen ? ' webkitAllowFullScreen mozallowfullscreen allowFullScreen' : ''}></iframe>}
      end
    end

  end
end
