require 'test_helper'

class MemoTest < ActiveSupport::TestCase
  def setup
    @memo = memos(:example)
  end

  test "content should be present" do
    @memo.content = ""
    assert_not @memo.valid?
  end
end
