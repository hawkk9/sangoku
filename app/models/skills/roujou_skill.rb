module Skills
  class RoujouSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 1,
            effect: Battle::Effect.new(method(:ganseki_battling_effect), :battling)
          },
          {
            level: 2,
            effect: Battle::Effect.new(method(:zoutiku_battling_effect), :battling)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:sanada_battling_effect), :battling)
          },
        ]
      end

      def ganseki_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
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
        return messages unless user.is_a?(Battle::DefenceUser)
        odds = user.strength / 13
        if Util::Calculator::draw_lots(odds)
          damage = rand(1..3)
          opponent_user.add_max_damage(rand(1..4))
          messages << Message::MessageWriter.message(
            "【罠】#{user.name}の増築！" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})" \
            "(最大ダメージ＝#{opponent_user.max_damage})"
          )
        end
        messages
      end

      def sanada_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
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
