module Likable

  def self.included(base)
    base.class_eval do
      def self.likable!(user_class=false)
        unless user_class
          self.class_eval do
            belongs_to :author, :class_name => "::User", :foreign_key => "author_id"
            delegate :points, :to => :likerate
          end
        end
        self.class_eval do
          has_many :likes, :as => :entity, :dependent => :destroy

          has_one :likerate, :as => :entity, :dependent => :destroy

          after_create :create_likerate

          include InstanceMethods
        end
      end
    end
  end

  module InstanceMethods

    def vote(user)
      self.likerate = Likerate.new unless self.likerate
      self.likerate.points += 1
      self.likes.create(:user => user) if likerate.save
      self.author.recalculate_likerate
    end

  end

end

ActiveRecord::Base.send(:include, Likable)
