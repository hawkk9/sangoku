module Battle
  module Battling
    class User
      attr_reader :max_damage
      delegate :strength,:intelligence, :leadership, :charm, :soldier, to: :@user

      def initialize(user)
        @user = user
        @max_damage = 1
        @shut_out_normal_attack = false
      end

      def add_max_damage(value)
        @max_damage += value
      end

      def to_shut_out_normal_attack!
        @shut_out_normal_attack = true
      end
    end
  end
end
