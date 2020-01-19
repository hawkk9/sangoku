class WarCommand < ApplicationRecord
  include UserMessage

  has_one :command
  belongs_to :town

  def execute
    messages = []

    attack_user = self.command.user
    defence_user = self.town.town_defences.order(:order).first.user
    messages << self.battle(attack_user, defence_user)

    messages.flatten
  end

  def inputed_label
    "#{self.town.name}へ出兵"
  end

  protected

  def battle(attack_user, defence_user)
    messages = []
    turn = 0

    attack_max_damage = (attack_user.attack - defence_user.defence) / 16
    defence_max_damage = (defence_user.attack - attack_user.defence) / 16
    messages << message("【#{attack_user.name}の最大ダメージ：#{attack_max_damage}】【#{defence_user.name}の最大ダメージ：#{defence_max_damage}】")

    while attack_user.soldier_num > 0 && defence_user.soldier_num > 0
      attack_damage = rand(1..attack_max_damage)
      defence_damage = rand(1..defence_max_damage)

      defence_user.soldier_num -= attack_damage
      defence_damage = 0 if defence_user.soldier_num > 0
      attack_user.soldier_num -= defence_damage
      messages << message("ターン#{turn}:#{attack_user.name} 透波【Sランク】(無し) #{attack_user.soldier_num}人 ↓(-#{defence_damage}) |#{defence_user.name} ミラーマン(無し) #{defence_user.soldier_num}人 ↓(-#{attack_damage})")
      turn += 1
    end

    messages
  end
end
