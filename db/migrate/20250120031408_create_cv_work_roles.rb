class CreateCVWorkRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :cv_work_roles do |t|
      t.string :title
      t.text :summary
      t.integer :position
      t.references :cv_work_tenures
    end
  end
end
