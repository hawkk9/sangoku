module Skills
  class JintokuSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 2,
            effect: Battle::Effect.new(method(:kasei_before_battle_effect), :before)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:iatu_before_battle_effect), :before)
          }
        ]
      end

      def kasei_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        up_max_damage = (user.charm - opponent_user.charm) / 50
        return messages if up_max_damage < 1
        user.add_max_damage(up_max_damage)
        messages << Message::MessageWriter.message(
          "【加勢】最大ダメージが+#{up_max_damage}されました！"
        )
        messages
      end

      def iatu_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        gain = (user.charm - opponent_user.charm) / 30
        return messages if gain < 1
        opponent_user.soldier.num -= gain
        user.soldier.num += gain
        messages << Message::MessageWriter.message(
          "【威圧】#{opponent_user.name}を威圧しました。" \
          "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{gain})" \
          "#{user.name} #{user.soldier.name_with_rank} #{user.soldier.num}人 (+#{gain})"
        )
        messages
      end
    end
  end
end
