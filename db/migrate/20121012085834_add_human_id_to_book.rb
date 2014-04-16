class AddHumanIdToBook < ActiveRecord::Migration
  def change
    add_column :books, :human_id, :string
  end
end
