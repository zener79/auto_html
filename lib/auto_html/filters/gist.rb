module AutoHtml
  class Gist < Filter

    def call(text)
      regex = %r{https?://gist\.github\.com/(\w+/)?(\d+)}
      text.gsub(regex) do
        gist_id = $2
        %{<script type="text/javascript" src="https://gist.github.com/#{gist_id}.js"></script>}
      end
    end

  end
end
