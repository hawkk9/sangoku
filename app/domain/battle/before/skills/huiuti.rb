module Battle
  module Before
    module Skills
      class Huiuti
        def initialize(user, opponent_user)
          @user = user
          @opponent_user = opponent_user
          @messages = []
        end

        def handle
          if enabled?
            @opponent_user.add_status_percent(-5)
            @messages.push('【不意打ち】不意打ちにより攻守が－５%になりました')
          end
          @messages
        end

        private

        def enabled?
          return false unless @user.is_attack?
          higher_target_status?
        end

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
end
