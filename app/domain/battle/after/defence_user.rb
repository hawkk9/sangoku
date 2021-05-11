module Battle
  module After
    class DefenceUser < User
      def is_attack?
        false
      end

      def is_defence?
        true
      end
    end
  end
end

