module Skills
  class BaseSkill
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
      effects.map do |effect|
        effect[:effect] if effect[:level] <= @level
      end.compact
    end

    def available_effects(timing)
      case timing
      when Battle::Effect::TIMING_BEFORE_BATTLE
        @before_battle_effects
      when Battle::Effect::TIMING_BATTLING
        @battling_effects
      when Battle::Effect::TIMING_AFTER_BATTLE
        @after_battle_effects
      end
    end
  end
end
