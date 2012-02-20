class Quote < ActiveRecord::Base
  belongs_to :book
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  validates :text, :presence => true
  validates :text, :length => {:maximum => 250 }

  def book_title
    book.try(:title)
  end

  def book_title=(title)
    self.book= Book.find_by_title(title) if title.present?
  end

end
