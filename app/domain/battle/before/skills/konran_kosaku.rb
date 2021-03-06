module Battle
  module Before
    module Skills
      class KonranKosaku
        MAX_HIT_PERCENT = 50

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
          return false unless @user.is_defence?
          return false unless meet_soldier_num?
          hit?
        end

        # 相手の兵数＜自軍の兵数×５
        def meet_soldier_num?
          @opponent_user.soldier.num < @user.soldier.num * 5
        end

        def hit?
          odds = Odds.new(hit_percent)
          odds.hit?
        end

        def hit_percent
          percent = @user.intelligence / 3
          percent <= MAX_HIT_PERCENT ? percent : MAX_HIT_PERCENT
        end
      end
    end
  end
end
