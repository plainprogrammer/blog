class CreateCVEducations < ActiveRecord::Migration[8.0]
  def change
    create_table :cv_educations do |t|
      t.integer :to_month
      t.integer :to_year
      t.string :institution
      t.string :degree
    end
  end
end
