class CreateScrapers < ActiveRecord::Migration
  def change
    create_table :scrapers do |t|
      t.string :name
      t.string :site_url
      t.string :rake_task

      t.timestamps
    end
  end
end
