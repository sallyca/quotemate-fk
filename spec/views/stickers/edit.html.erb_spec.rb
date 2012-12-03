require 'spec_helper'

describe "stickers/edit" do
  before(:each) do
    @sticker = assign(:sticker, stub_model(Sticker))
  end

  it "renders the edit sticker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stickers_path(@sticker), :method => "post" do
    end
  end
end
