require File.expand_path('../../unit_test_helper', __FILE__)

class ImageTest < Test::Unit::TestCase

  def test_transform
    filter = AutoHtml::Image.new
    result = filter.call('http://rors.org/images/rails.png')
    assert_equal '<img alt="" src="http://rors.org/images/rails.png" />', result
  end

  def test_dont_transform
    filter = AutoHtml::Image.new
    result = filter.call('http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gift-phusion-passenger-220/')
    assert_equal 'http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gift-phusion-passenger-220/', result
  end

  def test_dont_transform_a_formatted_image
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('<img src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" alt=""/>')
    assert_equal '<img src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" alt=""/>', result
  end

  def test_transform2
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg') { image({:alt => nil}) }
    assert_equal '<img alt="" src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" />', result
  end

  def test_transform3
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG')
    assert_equal '<img alt="" src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" />', result
  end

  def test_transform4
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG')
    assert_equal '<img alt="" src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" />', result
  end

  def test_transform5
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0')
    assert_equal '<img alt="" src="http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0" />', result
  end

  def test_transform6
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('Do you like this logo http://rors.org/images/rails.png? Yeah?')
    assert_equal 'Do you like this logo <img alt="" src="http://rors.org/images/rails.png" />? Yeah?', result
  end

  def test_transform7
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('http://tbn3.google.com/images?q=tbn:vS-jtEi9Xc8K6M:http://upload.wikimedia.org/wikipedia/commons/b/ba/Potturinn.jpeg')
    assert_equal '<img alt="" src="http://tbn3.google.com/images?q=tbn:vS-jtEi9Xc8K6M:http://upload.wikimedia.org/wikipedia/commons/b/ba/Potturinn.jpeg" />', result
  end

  def test_transform8
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('Which do you prefer, this one http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG, or this one http://rors.org/images/rails.png?')
    assert_equal 'Which do you prefer, this one <img alt="" src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" />, or this one <img alt="" src="http://rors.org/images/rails.png" />?', result
  end

  def test_https
    filter = AutoHtml::Image.new(alt: nil)
    result = filter.call('https://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png')
    assert_equal '<img alt="" src="https://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png" />', result
  end

  def test_proxy_option
    filter = AutoHtml::Image.new(alt: nil, proxy: "https://proxy/?url=")
    result = filter.call('http://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png')
    assert_equal '<img alt="" src="https://proxy/?url=http://img.skitch.com/20100910-1wrbg5749xe29ya5t3s85bnaiy.png" />', result
  end

end
