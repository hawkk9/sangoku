class CreateConscriptionCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :conscription_commands do |t|
      t.belongs_to :command, comment: "コマンドID", null: false, :foreign_key => {on_delete: :cascade}, index: { unique: true }
      t.integer :soldier_type, comment: "兵種", null: false
      t.integer :soldier_num, comment: "兵士数", null: false
      t.timestamps
    end
  end
end
