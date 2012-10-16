class CreateStickers < ActiveRecord::Migration
  def change
    create_table :stickers do |t|
      t.integer :quote_id
      t.string :color
      t.string :font
      t.integer :font_size

      t.timestamps
    end
  end
end
