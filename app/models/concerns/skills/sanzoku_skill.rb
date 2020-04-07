module Skills
  class SanzokuSkill < Skills::BaseSkill
    class << self
      def before_battle_effects
        [
          {
            level: 2,
            effect: method(:goudatu_before_battle_effect)
          }
        ]
      end

      def battling_effects
        [
          {
            level: 3,
            effect: method(:sikabane_battling_effect)
          }
        ]
      end

      def after_battle_effects
        [
          {
            level: 1,
            effect: method(:oihagi_after_battle_effect)
          }
        ]
      end

      def oihagi_after_battle_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::AttackUser)
        return messages unless user.is_win?(Battle::AttackUser)
        product = rand(2..5)
        price = user.intelligence * product
        opponent_user.gold -= price
        opponent_user.rice -= price
        user.gold += price
        user.rice += price
        messages << Message::MessageWriter.message(
          "【追い剥ぎ】#{price}Ｇと#{price}米を#{user.name}から奪われました！" \
        )
        messages
      end

      def goudatu_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::AttackUser)
        return messages unless user.intelligence >= opponent_user.intelligence
        user.attack_correction += opponent_user.arm
        messages << Message::MessageWriter.message(
          "#{opponent_user.name}の武器(#{opponent_user.arm})の威力が#{user.name}の攻撃力に追加されました！" \
        )
        messages
      end

      def sikabane_battling_effect(user, opponent_user, battle_context)
        messages = []
        return messages unless user.is_a?(Battle::AttackUser)
        need_down_num = (2100 / user.intelligence) + 3
        down_num = opponent_user.before_soldier_num - opponent_user.soldier.num
        if (down_num - user.down_correction) >= need_down_num
          user.down_correction += need_down_num
          user.add_max_damage(rand(1..3))
          messages << Message::MessageWriter.message(
            "【屍拾い】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})" \
          )
        end
        messages
      end
    end
  end
end
