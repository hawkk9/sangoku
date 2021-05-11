module Battle
  module After
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
