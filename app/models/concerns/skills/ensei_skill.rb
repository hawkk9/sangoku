module Skills
  class EnseiSkill < Skills::BaseSkill
    class << self
      def before_battle_effects
        [
          {
            level: 3,
            effect: method(:houi_before_battle_effect)
          }
        ]
      end

      def battling_effects
        [
          {
            level: 1,
            effect: method(:tokkan_battling_effect)
          },
          {
            level: 2,
            effect: method(:syokuji_battling_effect)
          }
        ]
      end

      def tokkan_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::AttackUser)
        odds = user.strength / 10
        if Util::Calculator::draw_lots(odds)
          damage = rand(1..5)
          opponent_user.soldier.num -= damage
          messages << Message::MessageWriter.message(
            "【突貫】#{user.name}が突貫を仕掛けました。" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
          )
        end
        messages
      end

      def syokuji_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::AttackUser)
        odds = user.strength / 11
        if Util::Calculator::draw_lots(odds)
          user.add_max_damage(1)
          messages << Message::MessageWriter.message(
            "【食事】#{user.name}の最大ダメージが1上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})"
          )
        end
        messages
      end

      def houi_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::AttackUser)
        max = user.leadership / 12
        down_attack_percent = rand(1..max)
        gain = opponent_user.attack * down_attack_percent / 100
        opponent_user.attack_correction -= gain
        user.defence_correction += gain
        messages << Message::MessageWriter.message(
          "【包囲】#{opponent_user.name}の攻撃力の#{down_attack_percent}％が#{user.name}の守備力になりました。"
        )
        turn = user.leadership / 10
        battle_context.turn_limit = battle_context.turn_limit + turn
        messages << Message::MessageWriter.message(
          "【包囲】#{user.name}により戦闘ターンが#{turn}ターン増加しました。"
        )
        messages
      end
    end
  end
end
