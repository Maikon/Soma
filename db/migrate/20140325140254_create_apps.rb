class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :key
      t.text :secret
      t.string :name

      t.timestamps
    end
  end
end
