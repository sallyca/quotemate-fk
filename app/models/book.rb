class Book < ActiveRecord::Base
  has_many :quotes
  has_one :cover
  has_one :image, :as => :entity, :dependent => :destroy
  belongs_to :author
end
