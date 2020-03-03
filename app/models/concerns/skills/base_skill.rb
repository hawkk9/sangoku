module Skills
  class BaseSkill
    CONDITIONS = {
      attack: 0,
      defence: 1
    }.freeze

    TIMINGS = {
      before_battle: 0,
      battling: 1,
      after_battle: 2,
    }.freeze

    class << self
      def before_battle_effects
        []
      end

      def battling_effects
        []
      end

      def after_battle_effects
        []
      end
    end

    def initialize(level)
      @level = level
      @before_battle_effects = self.effects_filter_by_level(self.class::before_battle_effects)
      @battling_effects = self.effects_filter_by_level(self.class::battling_effects)
      @after_battle_effects = self.effects_filter_by_level(self.class::after_battle_effects)
    end

    def effects_filter_by_level(effects)
      effects.filter do |effect|
        effect[:level] <= @level
      end
    end

    def available_effects(timing, conditions)
      case timing
      when TIMINGS[:before_battle]
        self.effects_filter_by_conditions(@before_battle_effects, conditions)
      when TIMINGS[:battling]
        self.effects_filter_by_conditions(@battling_effects, conditions)
      when TIMINGS[:after_battle]
        self.effects_filter_by_conditions(@after_battle_effects, conditions)
      end
    end

    protected

    def effects_filter_by_conditions(effects, conditions)
      effects.map do |effect|
        effect[:effect] if (effect[:conditions] & conditions).length >= effect[:conditions].length
      end.compact
    end
  end
end
