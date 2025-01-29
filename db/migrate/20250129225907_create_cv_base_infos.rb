class CreateCVBaseInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :cv_base_infos do |t|
      t.string :name
      t.string :subtitle
      t.text :summary
    end
  end
end
