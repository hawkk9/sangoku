module Battle
  class BattleParam
    attr_accessor :down_num
    attr_accessor :max_damage
    attr_accessor :damage

    def initialize
      self.down_num = 0
    end
  end
end
