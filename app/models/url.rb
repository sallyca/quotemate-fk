class Url < ActiveRecord::Base
  belongs_to :quote

  validates :link, :presence => true
end
