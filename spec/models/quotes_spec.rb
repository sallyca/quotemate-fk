require 'spec_helper'

describe Quote do
  describe "test all" do
    it "returns 0 for all gutter game" do
      quote = Quote.new
      quote.text.should eq(nil)
    end
  end
end