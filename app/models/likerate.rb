class Likerate < ActiveRecord::Base

  belongs_to :entity, :polymorphic => true

  def points
    super.to_i
  end

end
