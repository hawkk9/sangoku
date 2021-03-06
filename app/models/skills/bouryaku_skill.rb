module Skills
  class BouryakuSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 1,
            effect: Battle::Effect.new(method(:yuudou_before_battle_effect), :before)
          },
          {
            level: 2,
            effect: Battle::Effect.new(method(:bundan_before_battle_effect), :before)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:konran_before_battle_effect), :before)
          }
        ]
      end

      def yuudou_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
        if user.intelligence > opponent_user.intelligence
          if user.soldier.is_advantageous(opponent_user.soldier.soldier_type)
            user.add_max_damage(1)
            messages << Message::MessageWriter.message(
              "【誘導】最大ダメージがさらに+1されます。"
            )
          else
            opponent_user.disable_advantageous = true
            messages << Message::MessageWriter.message(
              "【誘導】最大ダメージ増加を阻止しました。"
            )
          end
        end
        messages
      end

      def bundan_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
        odds = user.intelligence / 2.5
        if Util::Calculator::draw_lots(odds)
          percent = [(user.intelligence / 15), 90].min
          damage = rand(1..5)
          opponent_user.attack_percent -= percent
          opponent_user.soldier.num -= damage
          messages << Message::MessageWriter.message(
            "【分断工作】#{opponent_user.name}の攻撃力が#{percent}%低下しました。" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
          )
        end
        messages
      end

      def konran_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
        if (user.soldier.num * 5) > opponent_user.soldier.num
          odds = [(user.intelligence / 3), 50].min
          if Util::Calculator::draw_lots(odds)
            opponent_user.disable_formation = true
            messages << Message::MessageWriter.message(
              "【混乱】#{opponent_user.name}の陣形が無効になりました。"
            )
          end
        end
        messages
      end
    end
  end
end
