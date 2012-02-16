require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
    should belong_to(:book)
    should_not allow_value("If a twosome is sex with two people, and a threesome is sex with three people, then now I know why I keep getting called handsome If a twosome is sex with two people, and a threesome is sex with three people, then now I know why I keep getting called handsome").for(:text)
end
