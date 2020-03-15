module Skills
  class NoukyouSkill < Skills::BaseSkill
    class << self
      def before_battle_effects
        [
          {
            level: 1,
            effect: method(:status_up_before_battle_effect),
            conditions: []
          },
          {
            level: 2,
            effect: method(:status_up_before_battle_effect),
            conditions: []
          },
          {
            level: 3,
            effect: method(:status_up_before_battle_effect),
            conditions: []
          },
        ]
      end

      def status_up_before_battle_effect(user, opponent_user, battle_context, is_attack)
        opponent_user.battle_param.add_status_percents(4)
        []
      end
    end
  end
end
