class Tag < ActiveRecord::Base
  has_and_belongs_to_many :quotes
  accepts_nested_attributes_for :quotes
end
