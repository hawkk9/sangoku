module Battle
  class AttackUser < BattleUser
    def initialize(user, mode)
      super(user)
      @mode = mode
    end
  end
end
