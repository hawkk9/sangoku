module Battle
  module Battling
    module Skills
      class ShikabaneHiroi
        def initialize(user, opponent_user)
          @user = user
          @opponent_user = opponent_user
          @messages = []
          @kill_count = 0
          @previous_number = @opponent_user.soldier.num
        end

        def handle
          @messages
        end
      end
    end
  end
end
