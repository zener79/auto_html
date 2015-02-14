require File.expand_path('../../unit_test_helper', __FILE__)

class TedTest < Test::Unit::TestCase

  def test_transform_url_with_www
    filter = AutoHtml::Ted.new
    output = filter.call('http://www.ted.com/talks/amy_cuddy_your_body_language_shapes_who_you_are.html')
    assert_equal '<iframe width="640" height="360" frameborder="0" scrolling="no" src="http://embed.ted.com/talks/amy_cuddy_your_body_language_shapes_who_you_are.html"></iframe>', output
  end

  def test_transform_url_without_www
    filter = AutoHtml::Ted.new
    output = filter.call('http://ted.com/talks/amy_cuddy_your_body_language_shapes_who_you_are.html')
    assert_equal '<iframe width="640" height="360" frameborder="0" scrolling="no" src="http://embed.ted.com/talks/amy_cuddy_your_body_language_shapes_who_you_are.html"></iframe>', output
  end

  def test_transform_url_with_options
    filter = AutoHtml::Ted.new(width: '50%', height: '100', scrolling: 'yes', frameborder: 1, allow_full_screen: true)
    result = filter.call('http://www.ted.com/talks/amy_cuddy_your_body_language_shapes_who_you_are.html')
    assert_equal '<iframe width="50%" height="100" frameborder="1" scrolling="yes" src="http://embed.ted.com/talks/amy_cuddy_your_body_language_shapes_who_you_are.html" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>', result
  end

end
