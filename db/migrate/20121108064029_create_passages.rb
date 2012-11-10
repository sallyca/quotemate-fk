class CreatePassages < ActiveRecord::Migration
  def change
    create_table :passages do |t|
      t.text :text
      t.integer :book_id

      t.timestamps
    end
  end
end
