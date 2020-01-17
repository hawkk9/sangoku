class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name, comment: "国名", null: false
      t.string :main_color, comment: "メイン国色", null: false
      t.string :sub_color, comment: "サブ国色", null: false

      t.timestamps
    end
  end
end
