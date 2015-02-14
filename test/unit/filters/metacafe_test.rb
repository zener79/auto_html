require File.expand_path('../../unit_test_helper', __FILE__)

class MetacafeTest < Test::Unit::TestCase

  def test_transform
    filter = AutoHtml::Metacafe.new
    result = filter.call("http://www.metacafe.com/watch/5440707/exclusive_tron_evolution_dev_diary_the_art_design")
    assert_equal '<div style="background:#000000;width:440px;height:272px"><embed flashVars="playerVars=showStats=no|autoPlay=no" src="http://www.metacafe.com/fplayer/5440707/exclusive_tron_evolution_dev_diary_the_art_design.swf" width="440" height="272" wmode="transparent" allowFullScreen="true" allowScriptAccess="always" name="Metacafe_5440707" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></div>', result
  end

  def test_transform_with_dimensions
    filter = AutoHtml::Metacafe.new(width: 500, height: 300)
    result = filter.call("http://www.metacafe.com/watch/5440707/exclusive_tron_evolution_dev_diary_the_art_design")
    assert_equal '<div style="background:#000000;width:500px;height:300px"><embed flashVars="playerVars=showStats=no|autoPlay=no" src="http://www.metacafe.com/fplayer/5440707/exclusive_tron_evolution_dev_diary_the_art_design.swf" width="500" height="300" wmode="transparent" allowFullScreen="true" allowScriptAccess="always" name="Metacafe_5440707" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></div>', result
  end

  def test_transform_with_show_stats
    filter = AutoHtml::Metacafe.new(width: 500, height: 300, show_stats: true)
    result = filter.call("http://www.metacafe.com/watch/5440707/exclusive_tron_evolution_dev_diary_the_art_design")
    assert_equal '<div style="background:#000000;width:500px;height:300px"><embed flashVars="playerVars=showStats=yes|autoPlay=no" src="http://www.metacafe.com/fplayer/5440707/exclusive_tron_evolution_dev_diary_the_art_design.swf" width="500" height="300" wmode="transparent" allowFullScreen="true" allowScriptAccess="always" name="Metacafe_5440707" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></div>', result
  end

  def test_transform_with_autoplay
    filter = AutoHtml::Metacafe.new(width: 500, height: 300, autoplay: true)
    result = filter.call("http://www.metacafe.com/watch/5440707/exclusive_tron_evolution_dev_diary_the_art_design")
    assert_equal '<div style="background:#000000;width:500px;height:300px"><embed flashVars="playerVars=showStats=no|autoPlay=yes" src="http://www.metacafe.com/fplayer/5440707/exclusive_tron_evolution_dev_diary_the_art_design.swf" width="500" height="300" wmode="transparent" allowFullScreen="true" allowScriptAccess="always" name="Metacafe_5440707" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></div>', result
  end

  def test_transform_with_options
    filter = AutoHtml::Metacafe.new(width: 500, height: 300, show_stats: true, autoplay: true)
    result = filter.call("http://www.metacafe.com/watch/5440707/exclusive_tron_evolution_dev_diary_the_art_design")
    assert_equal '<div style="background:#000000;width:500px;height:300px"><embed flashVars="playerVars=showStats=yes|autoPlay=yes" src="http://www.metacafe.com/fplayer/5440707/exclusive_tron_evolution_dev_diary_the_art_design.swf" width="500" height="300" wmode="transparent" allowFullScreen="true" allowScriptAccess="always" name="Metacafe_5440707" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed></div>', result
  end

end
