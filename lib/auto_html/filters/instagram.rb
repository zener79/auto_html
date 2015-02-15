module AutoHtml
  class Instagram

    def call(text)
      text << '/' unless text.end_with?('/')
      regex = %r{https?:\/\/(www.)?instagr(am\.com|\.am)/p/.+}
      text.gsub(regex) do
        %{<iframe src="#{text}embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>}
      end
    end

  end
end
