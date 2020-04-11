module Skills
  class NoukyouSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 1,
            effect: Battle::Effect.new(method(:status_up_before_battle_effect), :before)
          },
          {
            level: 2,
            effect: Battle::Effect.new(method(:status_up_before_battle_effect), :before)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:status_up_before_battle_effect), :before)
          },
        ]
      end

      def status_up_before_battle_effect(user, opponent_user, battle_context)
        opponent_user.add_status_percents(4)
        []
      end
    end
  end
end
