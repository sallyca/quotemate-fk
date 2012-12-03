require 'spec_helper'

describe "stickers/new" do
  before(:each) do
    assign(:sticker, stub_model(Sticker).as_new_record)
  end

  it "renders new sticker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stickers_path, :method => "post" do
    end
  end
end
