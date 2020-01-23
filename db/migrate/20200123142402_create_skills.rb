class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.belongs_to :user, comment: "ユーザーID", null: false, foreign_key: true
      t.integer :skill_type, comment: "スキル系統", null: false
      t.integer :level, comment: "スキルレベル", null: false
      t.timestamps
    end
  end
end
