require 'minitest/autorun'
require './list'

class TestList < Minitest::Test
  def setup
    @list = List.new
  end

  def test_add_show
    @list.add_show('Example Show', 'ABC')

    assert_equal(1, @list.shows.length)
    assert_equal('Example Show', @list.shows[0].title)
    assert_equal('ABC', @list.shows[0].network)
  end

  def test_add_to_favorite
    show_title = 'Example Show'
    @list.add_show(show_title, 'ABC')
    
    assert_equal(false, @list.shows[0].viewers_favorite)

    # Mock user input
    allow_user_input('Example Show')

    @list.add_to_favorite

    assert_equal(true, @list.shows[0].viewers_favorite)
  end

  def test_display_list
    @list.add_show('Example Show', 'ABC')
    @list.add_show('Another Show', 'XYZ')

    # Capture the output
    captured_output = capture_output { @list.display_list }

    expected_output = <<~OUTPUT
      List:
      Example Show - ABC 
      Another Show - XYZ 
    OUTPUT

    assert_equal(expected_output.chomp, captured_output.chomp)
  end

  private

  def allow_user_input(input)
    $stdin = StringIO.new(input)
  end

  def capture_output(&block)
    original_stdout = $stdout
    $stdout = StringIO.new
    block.call
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end
