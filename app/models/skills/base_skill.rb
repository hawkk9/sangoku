module Skills
  class BaseSkill
    EFFECTS = []

    ATTACK = 0
    DEFENCE = 1

    def initialize(level)
      @level = level
    end

    def effects(timings)
      self.class::EFFECTS.map do |effect|
        effect[:battling] if effect[:level] <= @level &&
          (effect[:timings] & timings).length == effect[:timings].length
      end.compact
    end
  end
end
