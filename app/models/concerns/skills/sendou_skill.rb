module Skills
  class SendouSkill < Skills::BaseSkill
    class << self
      def before_battle_effects
        [
          {
            level: 2,
            effect: method(:keiryaku_before_battle_effect)
          },
          {
            level: 3,
            effect: method(:nouminkasei_before_battle_effect)
          },
        ]
      end

      def battling_effects
        [
          {
            level: 1,
            effect: method(:kobu_battling_effect)
          },
        ]
      end

      def keiryaku_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        turn = user.charm / 10
        is_attack = user.is_a?(Battle::AttackUser)
        battle_context.turn_limit = battle_context.turn_limit + (turn * (is_attack ? 1 : -1))
        messages << Message::MessageWriter.message(
          "【計略】戦闘ターン数が#{turn}#{is_attack ? '増加' : '減少'}しました！（最大戦闘ターン数＝#{battle_context.turn_limit}）"
        )
        messages
      end

      def kobu_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.charm / 11
        if Util::Calculator::draw_lots(odds)
          user.add_max_damage(1)
          messages << Message::MessageWriter.message(
            "【鼓舞】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})"
          )
        end
        messages
      end

      def nouminkasei_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        deno = battle_context.town.allegiance != 0 ? 400 / battle_context.town.allegiance : 10
        num = user.charm / deno
        user.soldier.num += num
        messages << Message::MessageWriter.message(
          "【農民加勢】#{user.name}の兵数が上昇しました！(#{user.name}の兵数＝#{user.soldier.num})"
        )
        messages
      end
    end
  end
end
