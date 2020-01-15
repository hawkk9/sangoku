class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :period, comment: "期", null: false
      t.integer :year, comment: "年", null: false
      t.integer :month, comment: "月", null: false
      t.timestamps
    end
  end
end
