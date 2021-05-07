module Battle
  module Battling
    module Skills
      class Genei
        MAX_PERCENT = 25

        def initialize(user, opponent_user)
          @user = user
          @opponent_user = opponent_user
          @messages = []
        end

        def handle
          @user.to_shut_out_normal_attack! if hit?
        end

        def hit?
          odds = Odds.new(hit_percent)
          odds.hit?
        end

        def hit_percent
          percent = @user.leadership / 11
          percent <= MAX_PERCENT ? percent : MAX_PERCENT
        end
      end
    end
  end
end
