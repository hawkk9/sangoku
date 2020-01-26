class Skill < ApplicationRecord
  enum skill_type: {
    infantry: 0, cavalry: 1, archer: 2,
    move: 3, strategy: 4, tactics: 5,
    leader: 6, ninja: 7, plot: 8,
    agitation: 9, training: 10, fight: 11,
    anabasis: 12, besieging:13, bandit: 14,
    virtue: 15, elite: 16,
  }

  belongs_to :user

  ATTACK = 0
  DEFENCE = 1

  SKILL_OPTIONS = [
    {
      type: :strategy,
      level: 1,
      battling: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 11
        if rand(1..100) <= odds
          damage = rand(1..7)
          opponent_user.soldier_num -= damage
          Message::MessageWriter.message(
            "【罠】#{user.name}が落とし穴を仕掛けました。" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
          )
        end
      end,
      timings: [DEFENCE]
    },
    {
      type: :strategy,
      level: 2,
      battling: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 14
        if rand(1..100) <= odds
          recovery = rand(1..5)
          user.max_damage += 1
          user.soldier_num += recovery
          Message::MessageWriter.message(
            "【援軍】#{user.name}に援軍が到着しました。味方の攻撃力が上昇しました。" \
            "#{user.name} (最大ダメージ＝#{user.max_damage})#{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↑(+#{recovery})" \
          )
        end
      end,
      timings: [DEFENCE]
    },
    {
      type: :strategy,
      level: 3,
      battling: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 13
        if rand(1..100) <= odds
          damage = rand(1..5)
          opponent_user.soldier_num -= damage
          opponent_user.max_damage -= 1
          Message::MessageWriter.message(
            "【罠】#{user.name}が水攻めを仕掛けました。敵軍の攻撃力が低下しました。" \
            "#{opponent_user.name} (最大ダメージ＝#{opponent_user.max_damage}) #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
          )
        end
      end,
      timings: [DEFENCE]
    },
    {
      type: :tactics,
      level: 1,
      battling: nil,
      timings: []
    },
    {
      type: :tactics,
      level: 2,
      battling: Proc.new do |user, opponent_user|
        if user.mode == :ambush.to_s
          odds = (user.strength + user.intelligence) / 10
          if rand(1..100) <= odds
            damage = rand(1..5)
            opponent_user.soldier_num -= damage
            Message::MessageWriter.message(
              "●【夜襲】#{user.name}が夜襲を仕掛けました。兵が数人倒されました。" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
            )
          end
        end
      end,
      timings: [ATTACK]
    },
    {
      type: :tactics,
      level: 3,
      battling: Proc.new do |user, opponent_user|
        if user.mode == :assault.to_s
          odds = (user.intelligence + user.charm) / 7
          if rand(1..100) <= odds
            damage = rand(1..7)
            opponent_user.soldier_num -= damage
            Message::MessageWriter.message(
              "●【強襲】#{user.name}が強襲を仕掛けました。兵が数人倒されました。" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
            )
          end
        end
      end,
      timings: [ATTACK]
    },
    {
      type: :leader,
      level: 1,
      battling: nil,
      timings: []
    },
    {
      type: :leader,
      level: 2,
      battling: nil,
      timings: []
    },
    {
      type: :leader,
      level: 3,
      battling: Proc.new do |user, opponent_user|
        if user.mode == :assault.to_s
          odds = (user.intelligence + user.charm) / 7
          if rand(1..100) <= odds
            damage = rand(1..7)
            opponent_user.soldier_num -= damage
            Message::MessageWriter.message(
              "●【強襲】#{user.name}が強襲を仕掛けました。兵が数人倒されました。" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
            )
          end
        end
      end,
      timings: []
    },
  ]

  class << self
    def options_by_skill(skill, timings)
      SKILL_OPTIONS.filter do |skill_option|
        (skill_option[:type] == skill.skill_type.to_sym) &&
          (skill_option[:level] <= skill.level) &&
          ((skill_option[:timings] & timings).length == timings.length)
      end
    end
  end
end
