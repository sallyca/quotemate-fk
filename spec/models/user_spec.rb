# encoding: UTF-8

require 'spec_helper'

describe User do

  describe ".online?" do

    before(:each) do
      @user = FactoryGirl.create :user
    end

    it "should be true if last activity lt Time.now - 10 minutes" do
      @user.update_attribute(:last_activity_at, Time.now - 10.minutes + 1.second)
      @user.online?.should be_true
    end

    it "should be false if last activity eq Time.now - 10 minutes" do
      @user.update_attribute(:last_activity_at, Time.now - 10.minutes)
      @user.online?.should be_false
    end

    it "should be false if last activity gt Time.now - 10 minutes" do
      @user.update_attribute(:last_activity_at, Time.now - 10.minutes - 1.second)
      @user.online?.should be_false
    end
  end

end
