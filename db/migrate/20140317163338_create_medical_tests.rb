class CreateMedicalTests < ActiveRecord::Migration
  def change
    create_table :medical_tests do |t|
      t.date :taken_on
      t.string :type

      t.timestamps
    end
  end
end
