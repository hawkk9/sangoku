class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.belongs_to :user, comment: "ユーザーID", null:false
      t.integer :achievement_type, comment: "特殊技能種別", null: false
      t.timestamps
    end
  end
end
