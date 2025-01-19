class CreateCVWorkTenures < ActiveRecord::Migration[8.0]
  def change
    create_table :cv_work_tenures do |t|
      t.integer :from_month, null: false
      t.integer :from_year, null: false
      t.integer :to_month, null: true
      t.integer :to_year, null: true
      t.boolean :to_present, default: false
      t.string :employer, null: false
    end
  end
end
