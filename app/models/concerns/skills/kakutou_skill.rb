module Skills
  class KakutouSkill < Skills::BaseSkill
    class << self
      def battling_effects
        [
          {
            level: 1,
            effect: method(:kaisin_battling_effect),
            conditions: []
          },
          {
            level: 2,
            effect: method(:kiai_battling_effect),
            conditions: []
          },
          {
            level: 3,
            effect: method(:seiken_battling_effect),
            conditions: []
          }
        ]
      end

      def kaisin_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        odds = user.strength / 10
        if Util::Calculator::draw_lots(odds)
          min_damage = user.battle_param.max_damage / 2
          user.battle_param.damage = [user.battle_param.damage, min_damage].max if battle_param.damage != 0
          messages << Message::MessageWriter.message(
            "【会心の一撃】#{user.name}の会心の一撃！"
          )
        end
        messages
      end

      def kiai_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        odds = user.strength / 11
        if Util::Calculator::draw_lots(odds)
          user.battle_param.calc_max_damage(rand(1..2))
          messages << Message::MessageWriter.message(
            "【気合いため】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.battle_param.max_damage})"
          )
        end
        messages
      end

      def seiken_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        odds = user.strength / 14
        if Util::Calculator::draw_lots(odds)
          user.battle_param.damage *= 2
          messages << Message::MessageWriter.message(
            "【正拳突き】#{user.name}の正拳突き！"
          )
        end
        messages
      end
    end
  end
end
