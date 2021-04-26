module Battle
  class Odds
    def initialize(percent)
      @percent = percent
    end

    def hit?
      rand(1..100) <= @percent
    end
  end
end
