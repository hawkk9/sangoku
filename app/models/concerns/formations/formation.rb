module Formations
  class Formation
    COMPATIBILITY_HASH = {
      gyorin: [:gangetu, :kakuyoku, :tyouda],
      gangetu: [:gankou, :kakuyoku],
      gankou: [:gyorin, :kouyaku, :tora, :banzai, :sutegamari],
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
      def formation_correction_hash
        {
          gyorin: method(:gyorin_correction),
          gangetu: method(:gangetu_correction),
          gankou: method(:gankou_correction),
          kakuyoku: method(:gyorin_correction),
          housi: method(:gyorin_correction),
          kouyaku: method(:gyorin_correction),
          tyouda: method(:gyorin_correction),
          houen: method(:gyorin_correction),
          kurumagakari: method(:gyorin_correction),
          tora: method(:gyorin_correction),
          moroha: method(:gyorin_correction),
          donjin: method(:gyorin_correction),
          densetu: method(:gyorin_correction)
        }
      end

      def gyorin_correction(user, opponent_user, battle_context, is_attack)
        percent = 15
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          percent = 35
        end
        user.battle_param.attack_percent += percent
      end

      def gangetu_correction(user, opponent_user, battle_context, is_attack)
        correction = opponent_user.soldier_num - user.soldier_num
        return if correction <= 0
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          correction *= 2
        end
        user.battle_param.attack_correction += correction
      end

      def gankou_correction(user, opponent_user, battle_context, is_attack)
        correction = opponent_user.soldier_num - user.soldier_num
        return if correction <= 0
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          correction *= 2
        end
        user.battle_param.attack_correction += correction
      end
    end
  end
end