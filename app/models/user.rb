class User < ActiveRecord::Base
  
  authenticates_with_sorcery!
  has_many :quotes
  has_many :stickers

  attr_accessible :email, :password, :username

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email

  def to_param
    username
  end

  def self.from_param(param)
    find_by_username param
  end

  def online?
    Time.now < (last_activity_at + 10.minutes) if last_activity_at
  end

end
