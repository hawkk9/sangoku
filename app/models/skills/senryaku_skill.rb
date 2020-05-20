module Skills
  class SenryakuSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 1,
            effect: Battle::Effect.new(method(:otosiana_battling_effect), :battling)
          },
          {
            level: 2,
            effect: Battle::Effect.new(method(:engun_battling_effect), :battling)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:mizuzeme_battling_effect), :battling)
          },
        ]
      end

      def otosiana_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
        odds = (user.intelligence + user.charm) / 11
        if Util::Calculator::draw_lots(odds)
          damage = rand(1..7)
          opponent_user.soldier.num -= damage
          messages << Message::MessageWriter.message(
            "【罠】#{user.name}が落とし穴を仕掛けました。" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
          )
        end
        messages
      end

      def engun_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
        odds = (user.intelligence + user.charm) / 14
        if Util::Calculator::draw_lots(odds)
          recovery = rand(1..5)
          user.add_max_damage(1)
          user.soldier.num += recovery
          messages << Message::MessageWriter.message(
            "【援軍】#{user.name}に援軍が到着しました。味方の攻撃力が上昇しました。" \
            "#{user.name} (最大ダメージ＝#{user.max_damage})" \
            "#{opponent_user.soldier.name_with_rank} #{user.soldier.num}人 ↑(+#{recovery})"
          )
        end
        messages
      end

      def mizuzeme_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::DefenceUser)
        odds = (user.intelligence + user.charm) / 13
        if Util::Calculator::draw_lots(odds)
          damage = rand(1..5)
          opponent_user.soldier.num -= damage
          opponent_user.add_max_damage(1)
          messages << Message::MessageWriter.message(
            "【罠】#{user.name}が水攻めを仕掛けました。敵軍の攻撃力が低下しました。" \
            "#{opponent_user.name} (最大ダメージ＝#{opponent_user.max_damage})" \
            "#{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
          )
        end
        messages
      end
    end
  end
end
