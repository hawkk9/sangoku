module Battle
  module Battling
    class AttackUser < User
      def is_attack?
        true
      end

      def is_defence?
        false
      end
    end
  end
end
