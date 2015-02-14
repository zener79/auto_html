require File.expand_path('../../unit_test_helper', __FILE__)

class LinkTest < Test::Unit::TestCase

  def test_transform
    filter = AutoHtml::Link.new
    result = filter.call("http://vukajlija.com")
    assert_equal '<a href="http://vukajlija.com" >http://vukajlija.com</a>', result
  end

  def test_transform_with_the_slash_at_the_end
    filter = AutoHtml::Link.new
    result = filter.call("http://github.com/")
    assert_equal '<a href="http://github.com/" >http://github.com/</a>', result
  end

  def test_transform_with_param
    filter = AutoHtml::Link.new
    result = filter.call('http://example.com/abc?query=ruby')
    assert_equal '<a href="http://example.com/abc?query=ruby" >http://example.com/abc?query=ruby</a>', result
  end

  def test_transform_with_param_and_trailing_dot
    filter = AutoHtml::Link.new
    result = filter.call('http://example.com/abc?query=ruby.')
    assert_equal '<a href="http://example.com/abc?query=ruby" >http://example.com/abc?query=ruby</a>.', result
  end

  def test_transform_with_anchor_and_trailing_dot
    filter = AutoHtml::Link.new
    result = filter.call('http://example.com/example#id=123.12.')
    assert_equal '<a href="http://example.com/example#id=123.12" >http://example.com/example#id=123.12</a>.', result
  end

  def test_transform_with_commas
    filter = AutoHtml::Link.new
    result = filter.call('http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf')
    assert_equal '<a href="http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf" >http://www.dw-world.de/dw/article/0,,4708386,00.html?maca=ser-rss-ser-all-1494-rdf</a>', result
  end

  def test_transform_complex_url
    filter = AutoHtml::Link.new
    result = filter.call('http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0')
    assert_equal('<a href="http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0" >http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0</a>', result)
  end

  def test_transform_with_options
    filter = AutoHtml::Link.new(target: '_blank')
    result = filter.call("http://rors.org")
    assert_equal '<a href="http://rors.org" target="_blank">http://rors.org</a>', result
  end

  def test_transform_with_short_link_name_option
    filter = AutoHtml::Link.new(short_link_name: true)
    result = filter.call("http://rors.org?some=params&and=more") 
    assert_equal '<a href="http://rors.org?some=params&and=more" >http://rors.org</a>', result
  end

  def test_transform_with_short_link_name_option_false
    filter = AutoHtml::Link.new(short_link_name: false)
    result = filter.call("http://rors.org?some=params&and=more")
    assert_equal '<a href="http://rors.org?some=params&and=more" >http://rors.org?some=params&and=more</a>', result
  end
end
