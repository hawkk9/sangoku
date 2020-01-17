class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name, comment: "国名", null: false
      t.string :color_code, comment: "国色", null: false

      t.timestamps
    end
  end
end
