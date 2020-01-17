class CreateWarCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :war_commands do |t|
      t.belongs_to :command, comment: "コマンドID", null: false, :foreign_key => {on_delete: :cascade}, index: { unique: true }
      t.integer :town_id, comment: "侵攻先", null: false
      t.integer :mode, comment: "侵攻モード"
      t.timestamps
    end
  end
end
