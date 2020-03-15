module Formations
  class Formation
    COMPATIBILITY_HASH = {
      gyorin: [:gangetu, :kakuyoku, :tyouda],
      gangetu: [:gankou, :kakuyoku],
      kakuyoku: [:kurumagakari, :gankou, :tyouda],
      housi: [],
      kouyaku: [:gangetu, :tora, :banzai, :sutegamari, :gangetu],
      tyouda: [:houen, :kurumagakari],
      houen: [:housi, :tora, :banzai, :sutegamari],
      kurumagakari: [:kouyaku, :moroha, :donjin],
      tora: [],
      moroha: [],
      donjin: [],
      densetu: []
    }

    class << self
      def formation_percent_hash
        {
          gyorin: method(:gyorin_percent),
          gangetu: method(:gyorin_percent),
          kakuyoku: method(:gyorin_percent),
          housi: method(:gyorin_percent),
          kouyaku: method(:gyorin_percent),
          tyouda: method(:gyorin_percent),
          houen: method(:gyorin_percent),
          kurumagakari: method(:gyorin_percent),
          tora: method(:gyorin_percent),
          moroha: method(:gyorin_percent),
          donjin: method(:gyorin_percent),
          densetu: method(:gyorin_percent)
        }
      end

      def gyorin_percent(user, opponent_user, battle_context, is_attack)
        percent = 15
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          percent = 35
        end
        user.battle_param.attack_percent += percent
      end
    end
  end
end