class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :character_id, comment: "ID", :null => false
      t.string :password_digest, comment: "パスワードダイジェスト", :null => false
      t.string :name, comment: "名前", :null => false
      t.string :image_path, comment: "画像ファイルパス", :null => false
      t.integer :strength, comment: "武力", :null => false
      t.integer :strength_exp, comment: "武力経験値", :null => false
      t.integer :intelligence, comment: "知力", :null => false
      t.integer :intelligence_exp, comment: "知力経験値", :null => false
      t.integer :leadership, comment: "統率力", :null => false
      t.integer :leadership_exp, comment: "統率力経験値", :null => false
      t.integer :charm, comment: "人望", :null => false
      t.integer :charm_exp, comment: "人望経験値", :null => false
      t.integer :soldier_num, comment: "兵士数", :null => false
      t.integer :training, comment: "訓練", :null => false
      t.integer :country_id, comment: "国ID", :null => false, foreign_key: true
      t.integer :gold, comment: "金", :null => false
      t.integer :rice, comment: "米", :null => false
      t.integer :contributing, comment: "貢献", :null => false
      t.integer :rank, comment: "階級", :null => false
      t.integer :arm, comment: "武器", :null => false
      t.integer :guard, comment: "防具", :null => false
      t.integer :book, comment: "書物", :null => false
      t.integer :flag, comment: "旗", :null => false
      t.integer :delete_turn, comment: "削除ターン", :null => false
      t.integer :position, comment: "位置", :null => false
      t.string :email, comment: "メールアドレス", :null => false

      t.timestamps
    end
  end
end
