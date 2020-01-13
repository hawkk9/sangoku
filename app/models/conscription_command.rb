class ConscriptionCommand < ApplicationRecord
  has_one :command

  def execute(user)
    soldier = self.soldier(user)
    user.gold -= soldier.gold * self.soldier_num
    user.soldier_type = self.soldier_type
    user.soldier_num += self.soldier_num
    user.save
  end

  def inputed_label(user)
    soldier = Soldiers::Soldier.find_by_officer_and_type(user.officer_type, self.soldier_type)
    "#{soldier.name_with_rank}#{Command::COMMAND_LABEL_HASH[self.command.command_type]}（#{self.soldier_num}人:#{soldier.gold * self.soldier_num}Ｇ）"
  end

  protected

  def soldier(user)
    Soldiers::Soldier.find_by_officer_and_type(user.officer_type, self.soldier_type)
  end
end
