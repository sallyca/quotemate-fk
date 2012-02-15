class Book < ActiveRecord::Base
  has_many :quotes
  has_one :cover
end
