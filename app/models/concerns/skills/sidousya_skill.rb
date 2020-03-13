module Skills
  class SidousyaSkill < Skills::BaseSkill
    class << self
      def battling_effects
        [
          {
            level: 3,
            effect: method(:sennou_battling_effect),
            conditions: []
          }
        ]
      end

      def sennou_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        odds = (user.intelligence + user.charm) / 11
        if Util::Calculator::draw_lots(odds)
          damage = rand(1..5)
          opponent_user.soldier_num -= damage
          user.soldier_num += damage
          messages << Message::MessageWriter.message(
            "【洗脳】#{user.name}が#{opponent_user.name}の兵を洗脳しました。" \
            "#{opponent_user.name} #{opponent_user.soldier_num}人 ↓(-#{damage})" \
            " #{user.name} #{user.soldier_num}人 ↑(+#{damage})"
          )
        end
        messages
      end
    end
  end
end
