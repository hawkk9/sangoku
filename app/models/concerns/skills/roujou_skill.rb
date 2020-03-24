module Skills
  class RoujouSkill < Skills::BaseSkill
    class << self
      def battling_effects
        [
          {
            level: 1,
            effect: method(:ganseki_battling_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:defence]]
          },
          {
            level: 2,
            effect: method(:zoutiku_battling_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:defence]]
          },
          {
            level: 3,
            effect: method(:sanada_battling_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:defence]]
          },
        ]
      end

      def ganseki_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.strength / 10
        if Util::Calculator::draw_lots(odds)
          damage = rand(1..5)
          messages << Message::MessageWriter.message(
            "【罠】#{user.name}の岩石落とし！" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
          )
        end
        messages
      end

      def zoutiku_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.strength / 13
        if Util::Calculator::draw_lots(odds)
          damage = rand(1..3)
          opponent_user.battle_param.calc_max_damage(rand(1..4))
          messages << Message::MessageWriter.message(
            "【罠】#{user.name}の増築！" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})" \
            "(最大ダメージ＝#{opponent_user.battle_param.max_damage})"
          )
        end
        messages
      end

      def sanada_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.strength / 50
        if Util::Calculator::draw_lots(odds)
          damage = opponent_user.soldier.num / 2
          messages << Message::MessageWriter.message(
            "【罠】#{user.name}の真田丸！" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
          )
        end
        messages
      end
    end
  end
end
