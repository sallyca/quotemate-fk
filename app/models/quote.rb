class Quote < ActiveRecord::Base
  belongs_to :book

  validates :text, :presence => true
  validates :text, :length => {:maximum => 250 }

end
