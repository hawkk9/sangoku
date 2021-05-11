module Battle
  module Battling
    module Skills
      class ShikabaneHiroi
        MIN_NEED_KILL_COUNT = 10

        def initialize(user, opponent_user)
          @user = user
          @opponent_user = opponent_user
          @messages = []
          @start_soldier_num = @opponent_user.soldier.num
          @need_kill_count = need_kill_count
          @damage_up_count = 0
        end

        def handle
          return unless enabled?

          if kill_count >= need_kill_count
            @user.add_max_damage(increase_damage)
            @start_soldier_num = @opponent_user.soldier.num
            @damage_up_count += 1
          end

          @messages
        end

        private

        def enabled?
          return false unless @user.is_attack?
          @damage_up_count < 10
        end

        def need_kill_count
          count = (2100 / @user.intelligence) + 3
          count >= MIN_NEED_KILL_COUNT ? count : MIN_NEED_KILL_COUNT
        end

        def kill_count
          @start_soldier_num - @opponent_user.soldier.num
        end

        def increase_damage
          rand(1..3)
        end
      end
    end
  end
end
