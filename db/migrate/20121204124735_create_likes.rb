class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :entity_id
      t.string :entity_type

      t.timestamps
    end
  end
end
