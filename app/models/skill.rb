class Skill < ApplicationRecord
  belongs_to :user

  enum skill_type: {
    infantry: 0, cavalry: 1, archer: 2,
    move: 3, strategy: 4, tactics: 5,
    leader: 6, ninja: 7, plot: 8,
    agitation: 9, training: 10, fight: 11,
    anabasis: 12, besieging:13, bandit: 14,
    virtue: 15, elite: 16,
  }

  ATTACK = 0
  DEFENCE = 1

  SKILL_OPTIONS = [
    {
      type: :strategy,
      level: 1,
      invoker: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 11
        if rand(1..100) <= odds
          damage = rand(1..7)
          opponent_user.soldier_num -= damage
          Message::MessageWriter.message(
            "【罠】#{user.name}が落とし穴を仕掛けました。" \
            "#{opponent_user.name} 攻城兵 #{opponent_user.soldier_num}人 ↓(-#{damage})"
          )
        end
      end,
      timings: [DEFENCE]
    }
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
