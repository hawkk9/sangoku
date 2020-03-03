module Battle
  class BattleContext
    attr_accessor :mode
    attr_accessor :town
    attr_accessor :turn_limit

    def initialize(mode, town)
      @mode = mode
      @town = town
      @turn_limit = 37
    end
  end
end
