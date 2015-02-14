module AutoHtml
  class Dailymotion < Filter

    def call(text)
      width  = options[:width] || 480
      height = options[:height] || 360
      text.gsub(/http:\/\/www\.dailymotion\.com.*\/video\/(.+)_*/) do
        video_id = $1
        %{<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/#{video_id}&related=0" width="#{width}" height="#{height}"><param name="movie" value="http://www.dailymotion.com/swf/#{video_id}&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/#{video_id}?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/#{video_id}" width="#{width}" height="#{height}"/></a></object>}
      end
    end

  end
end
