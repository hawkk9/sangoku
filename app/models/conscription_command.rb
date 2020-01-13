class ConscriptionCommand < ApplicationRecord
  def execute(user)
    user.soldier_num += self.soldier_num
    user.save
  end

  def inputed_label(user)
    soldier = Soldiers::Soldier.find_by_officer_and_type(user.officer_type, self.soldier_type)
    "#{soldier.name_with_rank}徴兵（#{self.soldier_num}人:#{soldier.gold * self.soldier_num}Ｇ）"
  end
end
