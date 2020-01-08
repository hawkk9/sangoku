class CreateCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :commands do |t|
      t.belongs_to :user, comment: "ユーザーID", null: false, :foreign_key => true
      t.integer :command_no, comment: "コマンドNo", null: false
      t.integer :command_type, comment: "コマンド種別", null: false

      t.timestamps

      t.index [:user_id, :command_no], unique: true
    end
  end
end
