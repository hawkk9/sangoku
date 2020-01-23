class Game < ApplicationRecord
  PAY_MONTH = 1
  HARVEST_MONTH = 7

  class << self
    def step
      game = Game.first
      game.add_month(1)
      game.save
    end

    def is_pay_month
      Game.first.month == PAY_MONTH
    end

    def is_harvest_month
      Game.first.month == HARVEST_MONTH
    end

    def map_messages
      path = File.join(Rails.root, 'tmp/game/map')
      lines = []
      if File.exist?(path)
        File.foreach(path) do |line|
          lines << line.chomp
        end
      end
      lines
    end
  end

  def add_month(month)
    self.month += month
    if self.month > 12
      self.year += 1
      self.month = 1
    end
  end
end
