class Sticker < ActiveRecord::Base
  attr_reader :quotes
  belongs_to :quote
 
  def quotes=(text)
    quote = Quote.find_or_create_by_text(text) if text.present?
    sticker=Sticker.new(:quote_id=>quote.id)
    sticker.save
  end

end
