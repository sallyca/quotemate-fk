class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :quotes
  has_many :stickers

  attr_accessible :email, :password, :username

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email
end
