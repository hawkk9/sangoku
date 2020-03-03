module Battle
  class BattleParam
    attr_accessor :down_num
    attr_accessor :max_damage
    attr_accessor :damage
    attr_accessor :attack_percent
    attr_accessor :defence_percent

    def initialize
      self.down_num = 0
      self.attack_percent = 1
      self.defence_percent = 1
    end

    def add_status_percents(percent)
      self.attack_percent += percent
      self.defence_percent += percent
    end
  end
end
