module AutoHtml

  autoload :Filter,       'auto_html/filter'
  autoload :Format,       'auto_html/format'

  autoload :Dailymotion,  'auto_html/filters/dailymotion'
  autoload :Gist,         'auto_html/filters/gist'
  autoload :GoogleMap,    'auto_html/filters/google_map'
  autoload :HtmlEscape,   'auto_html/filters/html_escape'
  autoload :Image,        'auto_html/filters/image'
  autoload :Instagram,    'auto_html/filters/instagram'
  autoload :Link,         'auto_html/filters/link'
  autoload :Metacafe,     'auto_html/filters/metacafe'
  autoload :SimpleFormat, 'auto_html/filters/simple_format'
  autoload :Ted,          'auto_html/filters/ted'
  autoload :Vimeo,        'auto_html/filters/vimeo'
  autoload :Youtube,      'auto_html/filters/youtube'

end
