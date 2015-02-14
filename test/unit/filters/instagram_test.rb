require File.expand_path('../../unit_test_helper', __FILE__)

class InstagramTest < Test::Unit::TestCase
  def test_instagram_embed
    filter = AutoHtml::Instagram.new
    result = filter.call('http://instagram.com/p/WsQTLAGvx7/')
    assert_equal '<iframe src="http://instagram.com/p/WsQTLAGvx7/embed" height="714" width="616" frameborder="0" scrolling="no"></iframe>', result
  end
end
