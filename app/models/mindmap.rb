class Mindmap < ActiveRecord::Base

  has_one :image, :as => :entity, :dependent => :destroy
  accepts_nested_attributes_for :image, :allow_destroy => true, :reject_if => proc {|obj| obj.blank? }
  
end
