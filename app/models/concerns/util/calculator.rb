module Util
  class Calculator
    class << self
      def draw_lots(odds)
        rand(1..100) <= odds
      end
    end
  end
end