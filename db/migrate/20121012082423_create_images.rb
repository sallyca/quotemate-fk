class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_mime_type
      t.string :image_name
      t.integer :image_size
      t.integer :image_width
      t.integer :image_height
      t.string :image_uid
      t.string :image_ext
      t.integer :entity_id
      t.string :entity_type

      t.timestamps
    end
  end
end
