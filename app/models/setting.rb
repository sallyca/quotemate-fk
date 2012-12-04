class Setting < ActiveRecord::Base

  validates :name, :presence => true

  acts_as_indexed :fields => [:name]

  attr_accessible :name, :value

  class << self
    def find_or_set(name, value)
      get(name) || set(name, value)
    end

    alias :get_or_set :find_or_set

    def get(name)
      cache_read name
    end

    alias :[] :get

    def set(name, value)
      setting = find_or_initialize_by_name(name.to_s)
      setting.value = value
      setting.save
      setting.value
    end
  end

  # prettier version of the name.
  # site_name becomes Site Name
  def name
    super.to_s.titleize
  end

  def value
    replacements!(self[:value])
  end

  def value=(new_value)
    if ["1", "0"].include?(new_value)
      new_value = new_value == "1" ? true : false
    end
    if [true, false].include?(new_value)
      new_value = new_value.to_s
    end
    super
  end

end
