module AutoHtml
  class GoogleMap < Filter

    def call(text)
      width      = options[:width] || 420
      height     = options[:height] || 315
      style      = options[:style] || "color:#000;text-align:left"
      link_text  = options[:link_text] || "View Larger Map"
      type       = options[:type] || :normal
      show_info  = options[:show_info] == false ? false : true
      zoom       = options[:zoom] || 18
      more       = options[:more] || ''

      map_options = show_info ? '' : '&amp;iwloc=near'
      map_options << map_types[type] || ''
      map_options << "&amp;z=#{zoom}"
      map_options << more

      regex = /(https?):\/\/maps\.google\.([a-z\.]+)\/maps\?(.*)/
      text.gsub(regex) do
        domain_country = $2
        map_query = $3
        %{<iframe width="#{width}" height="#{height}" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="//maps.google.#{domain_country}/maps?f=q&amp;source=s_q&amp;#{map_query}&amp;output=embed#{map_options}"></iframe><br /><small><a href="//maps.google.#{domain_country}/maps?f=q&amp;source=embed&amp;#{map_query}" style="#{style}">#{link_text}</a></small>}
      end
    end

    def map_types
      @map_types ||= {
        normal:    '&amp;t=m',
        satellite: '&amp;t=k',
        terrain:   '&amp;t=p',
        hibrid:    '&amp;t=h'
      }
    end

  end
end
