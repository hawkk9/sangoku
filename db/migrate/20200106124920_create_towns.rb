class CreateTowns < ActiveRecord::Migration[6.0]
  def change
    create_table :towns do |t|
      t.string :name, comment: "都市名", null: false
      t.integer :country_id, comment: "国ID"
      t.integer :x, comment: "X座標", null: false
      t.integer :y, comment: "Y座標", null: false
      t.integer :level, comment: "都市レベル", null: false
      t.integer :farmer , comment: "農民数", null: false
      t.integer :allegiance , comment: "民忠", null: false
      t.integer :max_agriculture , comment: "農業最大値", null: false
      t.integer :agriculture , comment: "農業", null: false
      t.integer :max_commerce , comment: "商業最大値", null: false
      t.integer :commerce , comment: "商業", null: false
      t.integer :technology , comment: "技術力", null: false
      t.integer :max_wall , comment: "城壁最大値", null: false
      t.integer :wall , comment: "城壁", null: false
      t.integer :wall_durability , comment: "城壁耐久力", null: false

      t.timestamps
    end
  end
end
