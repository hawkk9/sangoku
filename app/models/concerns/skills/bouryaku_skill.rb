module Skills
  class BouryakuSkill < Skills::BaseSkill
    class << self
      def before_battle_effects
        [
          {
            level: 1,
            effect: method(:yuudou_before_battle_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:defence]]
          }
        ]
      end

      def yuudou_before_battle_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        if user.intelligence > opponent_user.intelligence
          if user.soldier.is_advantageous(opponent_user.soldier.attribute)
            user.battle_param.calc_max_damage(1)
            messages << Message::MessageWriter.message(
              "【誘導】最大ダメージがさらに+1されます。"
            )
          else
            opponent_user.battle_param.disable_advantageous = true
            messages << Message::MessageWriter.message(
              "【誘導】最大ダメージ増加を阻止しました。"
            )
          end
        end
        messages
      end
    end
  end
end
