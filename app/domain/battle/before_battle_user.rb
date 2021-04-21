module Battle
  class BeforeBattleUser
    attr_reader :attack_percent, :defence_percent
    delegate :strength,:intelligence, :leadership, :charm, to: :@user

    def initialize(user)
      @user = user
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
