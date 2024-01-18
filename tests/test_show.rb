require 'minitest/autorun'
require './show'

class TestShow < Minitest::Test
  def test_show_attributes
    show = Show.new("Example Show", "ABC")

    assert_equal("Example Show", show.title)
    assert_equal("ABC", show.network)
    assert_equal(false, show.viewers_favorite)
  end

  def test_viewers_favorite_toggle
    show = Show.new("Example Show", "ABC")

    assert_equal(false, show.viewers_favorite)

    show.viewers_favorite = true
    assert_equal(true, show.viewers_favorite)

    show.viewers_favorite = false
    assert_equal(false, show.viewers_favorite)
  end
end
