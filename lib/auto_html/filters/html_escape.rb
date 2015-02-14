# TODO: https://github.com/brianmario/escape_utils
module AutoHtml
  class HtmlEscape < Filter

    def call(text)
      text.to_s.gsub(/[&"><]/) { |special| map[special] }
    end

    def map
      @map ||= {
        '&' => '&amp;',
        '>' => '&gt;',
        '<' => '&lt;',
        '"' => '&quot;'
      }
    end

  end
end
