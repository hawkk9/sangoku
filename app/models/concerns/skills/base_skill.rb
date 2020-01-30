module Skills
  class BaseSkill
    EFFECTS = []

    ATTACK = 0
    DEFENCE = 1
    BEFORE_BATTLE = 2
    BATTLING = 3
    AFTER_BATTLE = 4

    def initialize(level)
      @level = level
    end

    def effects(timings)
      self.class::EFFECTS.map do |effect|
        effect[:effect] if effect[:level] <= @level &&
          (effect[:timings] & timings).length >= timings.length
      end.compact
    end
  end
end
