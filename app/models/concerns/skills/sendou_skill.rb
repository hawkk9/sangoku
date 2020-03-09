module Skills
  class SendouSkill < Skills::BaseSkill
    class << self
      def before_battle_effects
        [
          {
            level: 2,
            effect: method(:keiryaku_before_battle_effect),
            conditions: []
          },
          {
            level: 3,
            effect: method(:kasei_before_battle_effect),
            conditions: []
          },
        ]
      end

      def battling_effects
        [
          {
            level: 1,
            effect: method(:kobu_battling_effect),
            conditions: []
          },
        ]
      end

      def keiryaku_before_battle_effect(user, opponent_user, battle_context, is_attack)
        turn = user.charm / 10
        turn *= -1 unless is_attack
        battle_context.turn_limit += turn
        Message::MessageWriter.message(
          "【計略】戦闘ターン数が#{turn}#{is_attack ? '増加' : '減少'}しました！（最大戦闘ターン数＝#{battle_context.turn_limit}）"
        )
      end

      def kasei_before_battle_effect(user, opponent_user, battle_context, is_attack)
        deno = battle_context.town.allegiance != 0 ? 400 / battle_context.town.allegiance : 10
        num = user.charm / deno
        user.sholdier_num += num
        Message::MessageWriter.message(
          "【農民加勢】#{user.name}の兵数が上昇しました！(#{user.name}の兵数＝#{user.soldier_num})"
        )
      end

      def kobu_battling_effect(user, opponent_user, battle_context, is_attack)
        odds = user.charm / 11
        if rand(1..100) <= odds
          user.battle_param.max_damage += 1
          Message::MessageWriter.message(
            "【鼓舞】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.battle_param.max_damage})"
          )
        end
      end
    end
  end
end
