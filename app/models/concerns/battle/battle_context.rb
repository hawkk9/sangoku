module Battle
  class BattleContext
    attr_accessor :mode
    attr_accessor :town
    attr_reader :turn_limit

    def initialize(mode, town)
      @mode = mode
      @town = town
      @turn_limit = 37
    end

    def turn_limit=(value)
      @turn_limit = value
      @turn_limit = 5 if value < 5
    end
  end
end
