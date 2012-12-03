require 'spec_helper'

describe "stickers/show" do
  before(:each) do
    @sticker = assign(:sticker, stub_model(Sticker))
  end

  it "renders attributes in <p>" do
    render
  end
end
