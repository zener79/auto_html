require File.expand_path('../../unit_test_helper', __FILE__)

class DailyMotionTest < Test::Unit::TestCase

  def test_transform
    filter = AutoHtml::Dailymotion.new
    result = filter.call("http://www.dailymotion.com/en/featured/video/xag4p2_tempsmorttv-episode-01_shortfilms")
    assert_equal '<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/xag4p2_tempsmorttv-episode-01_shortfilms&related=0" width="480" height="360"><param name="movie" value="http://www.dailymotion.com/swf/xag4p2_tempsmorttv-episode-01_shortfilms&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/xag4p2_tempsmorttv-episode-01_shortfilms?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/xag4p2_tempsmorttv-episode-01_shortfilms" width="480" height="360"/></a></object>', result
  end

  def test_transform_with_tweaked_width
    filter = AutoHtml::Dailymotion.new(width: 500)
    result = filter.call("http://www.dailymotion.com/related/x9cyf6/video/x9tinl_happy-tree-friends-as-you-wish-part_fun")
    assert_equal '<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/x9tinl_happy-tree-friends-as-you-wish-part_fun&related=0" width="500" height="360"><param name="movie" value="http://www.dailymotion.com/swf/x9tinl_happy-tree-friends-as-you-wish-part_fun&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/x9tinl_happy-tree-friends-as-you-wish-part_fun?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/x9tinl_happy-tree-friends-as-you-wish-part_fun" width="500" height="360"/></a></object>', result
  end

  def test_transform_with_options
    filter = AutoHtml::Dailymotion.new(width: 500, height: 300)
    result = filter.call("http://www.dailymotion.com/video/xakv5i")
    assert_equal '<object type="application/x-shockwave-flash" data="http://www.dailymotion.com/swf/xakv5i&related=0" width="500" height="300"><param name="movie" value="http://www.dailymotion.com/swf/xakv5i&related=0"></param><param name="allowFullScreen" value="true"></param><param name="allowScriptAccess" value="always"></param><a href="http://www.dailymotion.com/video/xakv5i?embed=1"><img src="http://www.dailymotion.com/thumbnail/video/xakv5i" width="500" height="300"/></a></object>', result
  end

end
