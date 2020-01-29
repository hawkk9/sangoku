module Skills
  class TacticsSkill
    EFFECTS = [{
      level: 2,
      effect: Proc.new do |user, opponent_user|
        if user.mode == :ambush.to_s
          odds = (user.strength + user.intelligence) / 10
          if rand(1..100) <= odds
            damage = rand(1..5)
            opponent_user.soldier_num -= damage
            Message::MessageWriter.message(
              "【夜襲】#{user.name}が夜襲を仕掛けました。兵が数人倒されました。" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
            )
          end
        end
      end,
      timings: [ATTACK]
    },
    {
      level: 3,
      effect: Proc.new do |user, opponent_user|
        if user.mode == :assault.to_s
          odds = (user.intelligence + user.charm) / 7
          if rand(1..100) <= odds
            damage = rand(1..7)
            opponent_user.soldier_num -= damage
            Message::MessageWriter.message(
              "【強襲】#{user.name}が強襲を仕掛けました。兵が数人倒されました。" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
            )
          end
        end
      end,
      timings: [ATTACK]
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
