class WarCommand < ApplicationRecord
  enum mode: {
   siege: 0, development: 1, gossip: 2,
   ambush:3, assault: 4,
  }

  belongs_to :command
  belongs_to :town

  def execute
    attack_user = self.command.user
    defence_user = self.town.town_defences.order(:order).first.user
    battle = Battles::UsersBattle.new(attack_user, defence_user, self)
    battle.handle
  end

  def inputed_label
    "#{self.town.name}へ出兵"
  end
end
