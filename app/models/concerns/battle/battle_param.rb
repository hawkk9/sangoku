module Battle
  class BattleParam
    attr_accessor :down_num
    attr_accessor :before_soldier_num
    attr_accessor :max_damage
    attr_accessor :damage
    attr_accessor :attack_percent
    attr_accessor :defence_percent
    attr_accessor :attack_correction
    attr_accessor :defence_correction

    def initialize(user)
      self.before_soldier_num = user.soldier_num
      self.down_num = 0
      self.attack_percent = 1
      self.defence_percent = 1
      self.attack_correction = 0
      self.defence_correction = 0
    end

    def add_status_percents(percent)
      self.attack_percent += percent
      self.defence_percent += percent
    end
  end
end
