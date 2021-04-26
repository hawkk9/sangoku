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
        @opponent_user.to_disable_formation!
        @messages
      end
    end
  end
end
