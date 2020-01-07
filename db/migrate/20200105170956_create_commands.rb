class CreateCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :commands do |t|
      t.integer :user_id, comment: "ユーザーID", :null => false
      t.integer :command_no, comment: "コマンドNo", :null => false
      t.integer :command_type, comment: "コマンド種別", :null => false

      t.timestamps

      t.index [:user_id, :command_no], unique: true
    end
  end
end
