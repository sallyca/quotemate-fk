class User < ActiveRecord::Base
  
  authenticates_with_sorcery!
  has_many :quotes
  has_many :stickers
  LIKERATE_ENTITIES = [:quotes]

  attr_accessible :email, :password, :username

  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :username
  validates_uniqueness_of :email
  has_one :avatar, :class_name => "::Image", :as => :entity, :dependent => :destroy

  def to_param
    username
  end

  def self.from_param(param)
    find_by_username param
  end

  def online?
    Time.now < (last_activity_at + 10.minutes) if last_activity_at
  end

  def voted_for?(obj)
    raise "Invalid entity given" unless obj.try(:likes).is_a?(Array)
    obj.likes.exists?(:user_id => self.id)
  end

  def vote_for(obj)
    raise "User already voted for this entity" if voted_for?(obj)
    obj.vote self
  end

  def recalculate_likerate
    self.points = LIKERATE_ENTITIES.map{|obj|
      points_module = Setting.find_or_set("points_for_#{obj.to_s.downcase.singularize}", '1.0').to_f
      self.send(obj).any? ? (self.send(obj).map(&:points).compact.sum.to_f * points_module) : 0.0
    }.compact.sum.to_f + self.likerate.points
    raise "Something goes wrong with #{self.email}(#{self.nickname}) recalculate likerate method" unless self.save
    self.points
  end

end
