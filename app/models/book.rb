class Book < ActiveRecord::Base
  has_many :quotes
  has_one :cover
  belongs_to :author
end
