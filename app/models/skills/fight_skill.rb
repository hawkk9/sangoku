module Skills
  class FightSkill
    EFFECTS = [{
      level: 1,
      effect: Proc.new do |user, opponent_user|
        odds = user.strength / 10
        if rand(1..100) <= odds
          min_damage = user.max_damage / 2
          user.damage = [user.damage, min_damage].max
          Message::MessageWriter.message(
            "【会心の一撃】#{user.name}の会心の一撃！"
          )
        end
      end,
      timings: []
    },
    {
      level: 2,
      effect: Proc.new do |user, opponent_user|
        odds = user.strength / 11
        if rand(1..100) <= odds
          user.max_damage += rand(1..2)
          Message::MessageWriter.message(
            "【気合いため】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})"
          )
        end
      end,
      timings: []
    },
    {
      level: 3,
      effect: Proc.new do |user, opponent_user|
        odds = user.strength / 14
        if rand(1..100) <= odds
          user.damage = user.damage * 2
          Message::MessageWriter.message(
            "【正拳突き】#{user.name}の正拳突き！"
          )
        end
      end,
      timings: []
    }]

    def initialize(level)
      @level = level
    end

    def battling_actions
      EFFECTS.map do |effect|
        effect[:battling] if effect[:level] <= @level
      end.compact
    end
  end
end
