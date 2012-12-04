class CreateLikerates < ActiveRecord::Migration
  def change
    create_table :likerates do |t|
      t.integer :points
      t.integer :entity_id
      t.string :entity_type

      t.timestamps
    end
  end
end
