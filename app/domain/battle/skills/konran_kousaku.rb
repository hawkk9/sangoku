module Battle
  module Skills
    class KonranKousaku
      def initialize(user, opponent_user)
        @user = user
        @opponent_user = opponent_user
        @messages = []
      end

      def handle
        # 発動判定
        @opponent_user.to_disable_formation! if enabled?
        @messages
      end

      private

      def enabled?
        hit?
      end

      def hit?

      end
    end
  end
end
