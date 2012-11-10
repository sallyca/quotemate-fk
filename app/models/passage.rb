class Passage < ActiveRecord::Base

  belongs_to :book

  def book_title
    book.try(:title)
  end

  def book_title=(title)
    self.book = Book.find_or_create_by_title(title) if title.present?
  end

end
