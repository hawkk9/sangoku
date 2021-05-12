module Battle
  module After
    class User
      attr_accessor :killed_soldier_count
      delegate :strength,:intelligence, :leadership, :charm, :soldier, to: :@user

      def initialize(user)
        @user = user
      end
    end
  end
end
