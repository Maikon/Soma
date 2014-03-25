class AddTokenToApp < ActiveRecord::Migration
  def change
    add_column :apps, :token, :text
  end
end
