require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save url without link" do
    url = Url.new
    assert !url.save, "Saved url post without a link"
  end



end
