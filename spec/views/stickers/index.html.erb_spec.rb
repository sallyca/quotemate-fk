require 'spec_helper'

describe "stickers/index" do
  before(:each) do
    assign(:stickers, [
      stub_model(Sticker),
      stub_model(Sticker)
    ])
  end

  it "renders a list of stickers" do
    render
  end
end
