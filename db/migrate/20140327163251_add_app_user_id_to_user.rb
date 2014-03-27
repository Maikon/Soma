class AddAppUserIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :app_user_id, :integer
  end
end
