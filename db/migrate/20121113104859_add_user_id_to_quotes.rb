class AddUserIdToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :user_id, :integer
  end
end
