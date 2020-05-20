module Skills
  class IdouSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 3,
            effect: Battle::Effect.new(method(:tousou_before_battle_effect), :before)
          }
        ]
      end

      def tousou_before_battle_effect(user, opponent_user, battle_context)
        messages = []
        odds = 75
        if Util::Calculator::draw_lots(odds)
          battle_context.turn_limit = battle_context.turn_limit - 20
          messages << Message::MessageWriter.message(
            "【逃走】#{user.name}が逃走準備をしています。" \
            "(最大戦闘ターン数＝#{battle_context.turn_limit})" \
          )
        end
        messages
      end
    end
  end
end
