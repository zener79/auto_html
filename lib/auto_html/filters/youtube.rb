module AutoHtml
  class Youtube < Filter

    def call(text)
      regexp = /(https?:\/\/)?(www.)?(youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/watch\?feature=player_embedded&v=)([A-Za-z0-9_-]*)(\&\S+)?(\?\S+)?/
      text.gsub(regexp) do
        youtube_id = $4
        width  = options[:width] || 420
        height = options[:height] || 315
        wmode  = options[:wmode]
        frameborder  = options[:frameborder] || 0
        autoplay     = options[:autoplay] || false
        hide_related = options[:hide_related] || false
        src = "//www.youtube.com/embed/#{youtube_id}"
        params = []
        params << "wmode=#{wmode}" if wmode
        params << "autoplay=1" if autoplay
        params << "rel=0" if hide_related
        src += "?#{params.join '&'}" unless params.empty?
        %{<div class="video youtube"><iframe width="#{width}" height="#{height}" src="#{src}" frameborder="#{frameborder}" allowfullscreen></iframe></div>}
      end
    end

  end
end
