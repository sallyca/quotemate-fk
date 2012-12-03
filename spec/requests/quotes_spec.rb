require 'spec_helper'

describe "Quotes" do
  fixtures :quotes

  describe "GET /quotes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get quotes_path
      response.status.should be(200)
    end

    it "displays the quotes" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      Quote.create!(:text => 'Human-Computer Interaction')
      get quotes_path
      response.body.should include('Interaction')   
    end

    it "displays the quotes" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      Quote.create!(:text => 'Human-Computer Interaction')
      visit quotes_path
      page.should have_content('Interaction')
      end

    # it "supports js", :js => true do
    #   # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #   visit quotes_path
    #   click_link "test js"
    #   page.should have_content('js works')
    # end

  end

  describe "POST /quotes" do
     it "creates a quote" do
       post_via_redirect quotes_path, :quote => { :text => "mow lawn" }
       response.body.should include("mow lawn")
     end

     it "creates a quote" do
       visit new_quote_path(Quote.new)
       fill_in "Text", :with => "mow lawn"
       click_button "Create Quote"
       # page.should have_content("Successfully added quote.")
       page.should have_content("mow lawn")
      end
  end

  describe "EDIT /quotes" do
    it "edits a quote" do
      visit edit_quote_path(quotes(:one))
      fill_in "Text", :with => "it works"
      click_button "Update Quote"
      it workspage.should have_content("it works")
    end
  end

end
