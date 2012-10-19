class CreateMindmaps < ActiveRecord::Migration
  def change
    create_table :mindmaps do |t|
      t.string :title
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end
  end
end
