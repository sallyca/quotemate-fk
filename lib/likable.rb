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
      self.rating.points +=  1
      self.votes.create(:user => user) if rating.save
      self.author.recalculate_rating
    end

  end

end

ActiveRecord::Base.send(:include, Likable)
