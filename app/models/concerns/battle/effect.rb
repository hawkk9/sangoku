module Battle
  class Effect
    delegate :call, to: :@effect

    def initialize(effect, timing)
      @effect = effect
      @timing = timing
    end

    def callable?(timing)
      timing == @timing
    end
  end
end