class ConscriptionCommand < ApplicationRecord
  has_one :command

  def execute(user)
    soldier = self.soldier(user)
    price = soldier.gold * self.soldier_num
    user.gold -= price
    user.soldier_type = self.soldier_type
    user.soldier_num += self.soldier_num
    user.save
    ["●11月:#{user.soldier.name_with_rank}を+#{self.soldier_num}徴兵しました。金：-#{price}(13日19時57分)"]
  end

  def inputed_label(user)
    "#{user.soldier.name_with_rank}#{Command::COMMAND_LABEL_HASH[self.command.command_type]}（#{self.soldier_num}人:#{user.soldier.gold * self.soldier_num}Ｇ）"
  end

  protected

  def soldier(user)
    Soldiers::Soldier.find_by_officer_and_type(user.officer_type, self.soldier_type)
  end
end
