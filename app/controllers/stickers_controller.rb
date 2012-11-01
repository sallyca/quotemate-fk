class StickersController < InheritedResources::Base

  respond_to :json, :html
  
  def random_quotes
    @sticker = Sticker.new
    @quotes = Quote.limit(10) 
  end

  def index
    @sticker = Sticker.new
    @stickers = Sticker.all
    respond_with(@stickers)
  end

end
