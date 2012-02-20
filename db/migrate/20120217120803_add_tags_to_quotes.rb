class AddTagsToQuotes < ActiveRecord::Migration
  def change
    create_table :quotes_tags, :id => false do |t|
      t.integer  :quote_id
      t.integer  :tag_id
    end
  end
end
