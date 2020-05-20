module Skills
  class BaseSkill
    class << self
      def all_effects
        []
      end
    end

    def initialize(level)
      @level = level
      @effects = self.effects_filter_by_level
    end

    def effects_filter_by_level
      self.class.all_effects.
        map { |effect| effect[:effect] if effect[:level] <= @level }.
        compact
    end

    def available_effects(timing)
      @effects.filter { |effect| effect.callable?(timing) }
    end
  end
end
