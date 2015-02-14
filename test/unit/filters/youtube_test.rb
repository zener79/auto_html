require File.expand_path('../../unit_test_helper', __FILE__)

class YouTubeTest < Test::Unit::TestCase

  def test_transform
    filter = AutoHtml::Youtube.new
    result = filter.call('http://www.youtube.com/watch?v=BwNrmYRiX_o')
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform2
    filter = AutoHtml::Youtube.new
    result = filter.call('http://www.youtube.com/watch?v=BwNrmYRiX_o&eurl=http%3A%2F%2Fvukajlija.com%2Fvideo%2Fklipovi%3Fstrana%3D6&feature=player_embedded') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform3
    filter = AutoHtml::Youtube.new
    result = filter.call('http://www.youtube.com/watch?v=BwNrmYRiX_o&feature=related') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform4
    filter = AutoHtml::Youtube.new
    result = filter.call('foo http://www.youtube.com/watch?v=fT1ahr81HLw bar') { youtube }
    assert_equal 'foo <div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/fT1ahr81HLw" frameborder="0" allowfullscreen></iframe></div> bar', result
  end

  def test_transform5
    filter = AutoHtml::Youtube.new
    result = filter.call('foo http://www.youtube.com/watch?v=fT1ahr81HLw<br>bar') { youtube }
    assert_equal 'foo <div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/fT1ahr81HLw" frameborder="0" allowfullscreen></iframe></div><br>bar', result
  end

  def test_transform_url_without_www
    filter = AutoHtml::Youtube.new
    result = filter.call('http://youtube.com/watch?v=BwNrmYRiX_o') { youtube }
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_with_options
    filter = AutoHtml::Youtube.new(:width => 300, :height => 255, :frameborder => 1, :wmode => 'window')
    result = filter.call('http://www.youtube.com/watch?v=BwNrmYRiX_o')
    assert_equal '<div class="video youtube"><iframe width="300" height="255" src="//www.youtube.com/embed/BwNrmYRiX_o?wmode=window" frameborder="1" allowfullscreen></iframe></div>', result
  end

  def test_transform_with_short_url
    filter = AutoHtml::Youtube.new
    result = filter.call('http://www.youtu.be/BwNrmYRiX_o')
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/BwNrmYRiX_o" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_https
    filter = AutoHtml::Youtube.new
    result = filter.call("https://www.youtube.com/watch?v=t7NdBIA4zJg")
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_short_with_params
    filter = AutoHtml::Youtube.new
    result = filter.call("http://youtu.be/t7NdBIA4zJg?t=1s&hd=1")
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen></iframe></div>', result
  end

  def test_transform_without_protocol
    filter = AutoHtml::Youtube.new
    result = filter.call("www.youtube.com/watch?v=t7NdBIA4zJg")
    assert_equal '<div class="video youtube"><iframe width="420" height="315" src="//www.youtube.com/embed/t7NdBIA4zJg" frameborder="0" allowfullscreen></iframe></div>', result
  end

end
