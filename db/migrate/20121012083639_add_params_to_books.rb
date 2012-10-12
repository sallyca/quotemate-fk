class AddParamsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :import_url, :string
    add_column :books, :genre, :string
  end
end
