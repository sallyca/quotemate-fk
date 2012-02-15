class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.integer :book_id

      t.timestamps
    end
  end
end
