class Quote < ActiveRecord::Base
  
  belongs_to :book
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  has_many :stickers
  belongs_to :user

  validates :text, :presence => true
  validates :text, :length => {:maximum => 250}
  attr_reader :tag_tokens

  scope :short, where("length(text) < 80")
  scope :for_sticker, where("length(text) < 150")

  def book_title
    book.try(:title)
  end

  def book_title=(title)
    self.book = Book.find_or_create_by_title(title) if title.present?
  end

  def tag_tokens=(keyword)
    self.tags << Tag.find_or_create_by_keyword(keyword) if keyword.present?
  end

end
