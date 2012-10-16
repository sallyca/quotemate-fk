class Sticker < ActiveRecord::Base
  attr_reader :quotes
 
  def quotes=(text)
    quote = Quote.find_or_create_by_text(text) if text.present?
  end

end
