require File.expand_path('../../unit_test_helper', __FILE__)

class HtmlEscapeTest < Test::Unit::TestCase

  def test_trasform
    filter = AutoHtml::HtmlEscape.new
    result = filter.call("<script>alert(0)</script>")
    assert_equal "&lt;script&gt;alert(0)&lt;/script&gt;", result
  end

  def test_trasform2
    filter = AutoHtml::HtmlEscape.new
    result = filter.call("<div>test</div>")
    assert_equal "&lt;div&gt;test&lt;/div&gt;", result
  end

end
