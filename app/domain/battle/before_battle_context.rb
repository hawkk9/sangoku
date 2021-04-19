module Battle
  class BeforeBattleContext
    def initialize
      @turn_limit = 37
      @attack_user_param = BeforeBattleParam.new
      @defence_user_param = BeforeBattleParam.new
    end
  end
end
