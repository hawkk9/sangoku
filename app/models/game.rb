class Game < ApplicationRecord
  PAY_MONTH = 1
  HARVEST_MONTH = 7

  class << self
    def step
      game = Game.first
      game.month += 1
      if game.month > 12
        game.year += 1
        game.month = 1
      end
      game.save
    end

    def is_pay_month
      Game.first.month == PAY_MONTH
    end

    def is_harvest_month
      Game.first.month == HARVEST_MONTH
    end
  end
end
