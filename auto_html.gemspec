Gem::Specification.new do |gem|
  gem.name = 'auto_html'
  gem.version = '2.0.0'

  gem.summary = "Transform URIs to appropriate markup"
  gem.description = "Automatically transforms URIs (via domain) and includes the destination resource (Vimeo, YouTube movie, image, ...) in your document"

  gem.author   = 'Dejan Simic'
  gem.email    = 'desimic@gmail.com'
  gem.homepage = 'https://github.com/dejan/auto_html'
  gem.license  = 'MIT'

  gem.add_dependency 'banzai',     '~> 0.1'
  gem.add_dependency 'tag_helper', '~> 0.2'
  gem.add_dependency 'rinku',      '~> 1.7'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'test-unit'

  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*',
                  'README*', 'LICENSE'] & `git ls-files -z`.split("\0")
end

