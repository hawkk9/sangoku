module Skills
  class SendouSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 1,
            effect: Battle::Effect.new(method(:kobu_battling_effect), :battling)
          },
          {
            level: 2,
            effect: Battle::Effect.new(method(:keiryaku_before_battle_effect), :before)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:nouminkasei_before_battle_effect), :before)
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
        return messages if user.soldier.rank == :mirror.to_s
        deno = user.town.allegiance != 0 ? 400 / user.town.allegiance : 10
        num = user.charm / deno
        user.soldier.num += num
        messages << Message::MessageWriter.message(
          "【農民加勢】#{user.name}の兵数が上昇しました！(#{user.name}の兵数＝#{user.soldier.num})"
        )
        # TODO: 帰兵
        messages
      end
    end
  end
end
