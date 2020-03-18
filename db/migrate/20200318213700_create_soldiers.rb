class CreateSoldiers < ActiveRecord::Migration[6.0]
  def change
    create_table :soldiers do |t|
      t.belongs_to :user, comment: "ユーザーID", null: false, foreign_key: true
      t.integer :rank, comment: "兵ランク", null: false
      t.integer :soldier_type, comment: "兵種", null: false
      t.integer :soldier_num, comment: "兵士数", null: false
      t.timestamps
    end
  end
end
