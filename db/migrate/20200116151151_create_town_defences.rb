class CreateTownDefences < ActiveRecord::Migration[6.0]
  def change
    create_table :town_defences do |t|
      t.belongs_to :town, comment: "街ID", null: false, foreign_key: true
      t.belongs_to :user, comment: "ユーザーID", null: false, foreign_key: true
      t.integer :order, comment: "守備順", null: false
      t.timestamps
    end
  end
end
