module Battle
  module After
    module Skills
      class OkyuSyoti
        MAX_HIT_PERCENT = 90

        def initialize(user, opponent_user)
          @user = user
          @opponent_user = opponent_user
          @messages = []
        end

        def handle
          # 倒された兵の0～5割を復活
          recover if hit?
        end

        private

        def recover
          @user.soldier.add_soldier_num(recover_soldier_num)
        end

        def recover_soldier_num
          percent = Percent.new(recover_percent)
          percent.calculate(@user.killed_soldier_count)
        end

        def recover_percent
          rand(0..50)
        end

        def hit?
          odds = Odds.new(hit_percent)
          odds.hit?
        end

        def hit_percent
          percent = @user.leadership / 3
          percent <= MAX_HIT_PERCENT ? percent : MAX_HIT_PERCENT
        end
      end
    end
  end
end
