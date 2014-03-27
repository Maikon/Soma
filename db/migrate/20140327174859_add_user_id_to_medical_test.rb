class AddUserIdToMedicalTest < ActiveRecord::Migration
  def change
    add_column :medical_tests, :user_id, :integer
  end
end
