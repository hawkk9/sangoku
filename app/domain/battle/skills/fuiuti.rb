module Battle
  module Skills
    class Fuiuti
      def initialize(user, opponent_user)
        @user = user
        @opponent_user = opponent_user
      end

      def handle
         if higher_target_status?
           @opponent_user.add_status_percent(-5)
         end
        # メッセージ作成
      end

      private

      def higher_target_status?
        return higher_status?(@user.strength, @opponent_user.strength) if @user.strength > @user.intelligence
        higher_status?(@user.intelligence, @opponent_user.intelligence)
      end

      def higher_status?(status, opponent_status)
        status >= opponent_status
      end
    end
  end
end
