require File.expand_path('../../unit_test_helper', __FILE__)

class SimpleFormatTest < Test::Unit::TestCase

  def test_empty
    filter = AutoHtml::SimpleFormat.new
    result = filter.call(nil)
    assert_equal '<p></p>', result
  end


  def test_transform
    filter = AutoHtml::SimpleFormat.new
    result = filter.call('Hey check out my blog => http://rors.org')
    assert_equal '<p>Hey check out my blog => http://rors.org</p>', result
  end

  def test_trasform2
    filter = AutoHtml::SimpleFormat.new
    result = filter.call('Hey check out my code => http://github.com/dejan')
    assert_equal '<p>Hey check out my code => http://github.com/dejan</p>', result
  end

  def test_trasform3
    assert_equal '<p>We want to put a paragraph...\n\n...right there.</p>', simple_format('We want to put a paragraph...\n\n...right there.')
  end

  def test_simple_format
    assert_equal "<p></p>", simple_format(nil)

    assert_equal "<p>crazy\n<br /> cross\n<br /> platform linebreaks</p>", simple_format("crazy\r\n cross\r platform linebreaks")
    assert_equal "<p>A paragraph</p>\n\n<p>and another one!</p>", simple_format("A paragraph\n\nand another one!")
    assert_equal "<p>A paragraph\n<br /> With a newline</p>", simple_format("A paragraph\n With a newline")

    text = "A\nB\nC\nD".freeze
    assert_equal "<p>A\n<br />B\n<br />C\n<br />D</p>", simple_format(text)

    text = "A\r\n  \nB\n\n\r\n\t\nC\nD".freeze
    assert_equal "<p>A\n<br />  \n<br />B</p>\n\n<p>\t\n<br />C\n<br />D</p>", simple_format(text)

    assert_equal %q(<p class="test">This is a classy test</p>), simple_format("This is a classy test", :class => 'test')
    assert_equal %Q(<p class="test">para 1</p>\n\n<p class="test">para 2</p>), simple_format("para 1\n\npara 2", :class => 'test')
  end

  def simple_format(text, html_options={})
    filter = AutoHtml::SimpleFormat.new(html_options: html_options)
    filter.call(text)
  end



end
