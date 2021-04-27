module Battle
  module Before
    class User
      attr_reader :attack_percent, :defence_percent
      delegate :strength,:intelligence, :leadership, :charm, :soldier, to: :@user

      def initialize(user)
        @user = user
        @attack_percent = 100
        @defence_percent = 100
        @attack_correction = 0
        @defence_correction = 0
        @disable_formation = false
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

      def to_disable_formation!
        @disable_formation = true
      end

      def formation
        return nil if @disable_formation
        @user.formation
      end
    end
  end
end
