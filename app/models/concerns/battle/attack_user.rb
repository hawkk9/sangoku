module Battle
  class AttackUser < BattleUser
    attr_reader :mode

    def initialize(user, mode)
      super(user)
      @mode = mode
    end
  end
end
