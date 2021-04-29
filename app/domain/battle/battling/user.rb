module Battle
  module Battling
    class User
      delegate :strength,:intelligence, :leadership, :charm, :soldier, to: :@user

      def initialize(user)
        @user = user
      end
    end
  end
end
