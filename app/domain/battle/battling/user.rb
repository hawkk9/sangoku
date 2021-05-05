module Battle
  module Battling
    class User
      attr_reader :max_damage
      delegate :strength,:intelligence, :leadership, :charm, :soldier, to: :@user

      def initialize(user)
        @user = user
        @max_damage = 1
      end

      def add_max_damage(value)
        @max_damage += value
      end
    end
  end
end
