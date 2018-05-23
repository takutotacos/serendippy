require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  def setup
    @genre = Genre.new(name: "example")
  end

  test "name should be present" do
    @genre.name = ""
    assert_not @genre.valid?
  end
end
