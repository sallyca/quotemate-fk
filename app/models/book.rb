class Book < ActiveRecord::Base
  has_many :quotes
  has_one :cover
  has_one :image, :as => :entity, :dependent => :destroy
  belongs_to :author

  scope :with_quotes, :include    => :quotes, 
                             :conditions => "quotes.id IS NOT NULL"

  accepts_nested_attributes_for :image, :allow_destroy => true, :reject_if => proc {|obj| obj.blank? }
end
