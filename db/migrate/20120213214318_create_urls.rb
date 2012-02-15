class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :link
      t.references :quote

      t.timestamps
    end
    add_index :urls, :quote_id
  end
end
