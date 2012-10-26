class StickersController < InheritedResources::Base
  
  def random_quotes
    @quotes = Quote.limit(10) 
  end
  
end
