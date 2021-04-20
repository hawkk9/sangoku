module Battle
  class BeforeBattleUser
    def initialize
      @attack_percent = 100
      @defence_percent = 100
      @attack_correction = 0
      @defence_correction = 0
    end

    def add_status_percent(value)
      add_attack_percent(value)
      add_defence_percent(value)
    end

    def add_attack_percent(value)
      @attack_percent += value
    end

    def add_defence_percent(value)
      @defence_percent += value
    end
  end
end
