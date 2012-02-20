class Quote < ActiveRecord::Base
  belongs_to :book
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  validates :text, :presence => true
  validates :text, :length => {:maximum => 250 }

end
