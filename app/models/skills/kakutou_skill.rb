module Skills
  class KakutouSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 1,
            effect: Battle::Effect.new(method(:kaisin_battling_effect), :battling)
          },
          {
            level: 2,
            effect: Battle::Effect.new(method(:kiai_battling_effect), :battling)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:seiken_battling_effect), :battling)
          }
        ]
      end

      def kaisin_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.strength / 10
        if Util::Calculator::draw_lots(odds)
          min_damage = user.max_damage / 2
          user.damage = [user.damage, min_damage].max if damage != 0
          messages << Message::MessageWriter.message(
            "【会心の一撃】#{user.name}の会心の一撃！"
          )
        end
        messages
      end

      def kiai_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.strength / 11
        if Util::Calculator::draw_lots(odds)
          user.add_max_damage(rand(1..2))
          messages << Message::MessageWriter.message(
            "【気合いため】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})"
          )
        end
        messages
      end

      def seiken_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.strength / 14
        if Util::Calculator::draw_lots(odds)
          user.damage *= 2
          messages << Message::MessageWriter.message(
            "【正拳突き】#{user.name}の正拳突き！"
          )
        end
        messages
      end
    end
  end
end
