class StickersController < InheritedResources::Base

  respond_to :json
  
  def random_quotes
    @quotes = Quote.limit(10) 
  end

end
