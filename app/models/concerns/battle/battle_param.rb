module Battle
  class BattleParam
    attr_accessor :before_soldier_num
    attr_accessor :damage
    attr_reader :max_damage
    attr_accessor :attack_percent
    attr_accessor :defence_percent
    attr_accessor :attack_correction
    attr_accessor :defence_correction
    attr_accessor :down_correction
    attr_accessor :disable_advantageous

    def initialize(user)
      @max_damage = 1
      self.before_soldier_num = user.soldier_num
      self.attack_percent = 100
      self.defence_percent = 100
      self.attack_correction = 0
      self.defence_correction = 0
      self.down_correction = 0
      self.disable_advantageous = false
    end

    def add_status_percents(percent)
      self.attack_percent += percent
      self.defence_percent += percent
    end

    def calc_max_damage(value)
      @max_damage += value
      @max_damage = 1 if @max_damage < 1
    end
  end
end
