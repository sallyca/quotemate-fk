class Quote < ActiveRecord::Base
  belongs_to :book
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  validates :text, :presence => true
  validates :text, :length => {:maximum => 250 }
  attr_reader :tag_tokens

  def book_title
    book.try(:title)
  end

  def book_title=(title)
    self.book = Book.find_or_create_by_title(title) if title.present?
  end

  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end

end
