require File.expand_path('../../unit_test_helper', __FILE__)

class VimeoTest < Test::Unit::TestCase

  def test_transform_url_with_www
    filter = AutoHtml::Vimeo.new
    result = filter.call('http://www.vimeo.com/3300155')
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>', result
  end

  def test_transform_url_without_www
    filter = AutoHtml::Vimeo.new
    result = filter.call('http://vimeo.com/3300155')
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>', result
  end

  def test_transform_url_with_params
    filter = AutoHtml::Vimeo.new
    result = filter.call('http://vimeo.com/3300155?pg=embed&sec=')
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>', result
  end

  def test_transform_url_with_anchor
    filter = AutoHtml::Vimeo.new
    result = filter.call('http://vimeo.com/3300155#skirt')
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>', result
  end

  def test_transform_with_options
    filter = AutoHtml::Vimeo.new(width: 300, height: 250)
    result = filter.call("http://www.vimeo.com/3300155")
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="300" height="250" frameborder="0"></iframe>', result
  end

  def test_transform_with_title
    filter = AutoHtml::Vimeo.new(width: 300, height: 250, show_title: true)
    result = filter.call("http://www.vimeo.com/3300155")
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?byline=0&portrait=0" width="300" height="250" frameborder="0"></iframe>', result
  end

  def test_transform_with_byline
    filter = AutoHtml::Vimeo.new(width: 300, height: 250, show_byline: true)
    result = filter.call("http://www.vimeo.com/3300155")
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&portrait=0" width="300" height="250" frameborder="0"></iframe>', result
  end

  def test_transform_with_portrait
    filter = AutoHtml::Vimeo.new(width: 300, height: 250, show_portrait: true)
    result = filter.call("http://www.vimeo.com/3300155")
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0" width="300" height="250" frameborder="0"></iframe>', result
  end

  def test_transform_url_with_https
    filter = AutoHtml::Vimeo.new
    result = filter.call('https://vimeo.com/3300155')
    assert_equal '<iframe src="//player.vimeo.com/video/3300155?title=0&byline=0&portrait=0" width="440" height="248" frameborder="0"></iframe>', result
  end

end
