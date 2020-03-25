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

    LABEL_HASH = {
      gyorin: {
        name: '魚鱗の陣',
        description: '攻撃力１５％UP。偃月の陣、鶴翼の陣、長蛇の陣に対しては１５％→３５％。'
      },
      gangetu: {
        name: '偃月の陣',
        description: ''
      },
      gankou: {
        name: '雁行の陣',
        description: ''
      },
      kakuyoku: {
        name: '鶴翼の陣',
        description: ''
      },
      housi: {
        name: '鋒矢の陣',
        description: ''
      },
      kouyaku: {
        name: '衝軛の陣',
        description: ''
      },
      tyouda: {
        name: '長蛇の陣',
        description: ''
      },
      houen: {
        name: '方円の陣',
        description: ''
      },
      kurumagakari: {
        name: '車懸り陣',
        description: ''
      },
      tora: {
        name: '虎の陣',
        description: ''
      },
      moroha: {
        name: '諸刃の陣',
        description: ''
      },
      donjin: {
        name: '鈍刃の陣',
        description: ''
      },
      densetu: {
        name: '伝説の陣',
        description: ''
      }
    }

    class << self
      def formation_correction_hash
        {
          gyorin: method(:gyorin_correction),
          gangetu: method(:gangetu_correction),
          gankou: method(:gankou_correction),
          kakuyoku: method(:kakuyoku_correction),
          housi: nil,
          kouyaku: method(:kouyaku_correction),
          tyouda: method(:tyouda_correction),
          houen: method(:houen_correction),
          kurumagakari: method(:kurumagakari_correction),
          tora: nil,
          moroha: method(:moroha_correction),
          donjin: method(:donjin_correction),
          densetu: method(:densetu_correction)
        }
      end

      def gyorin_correction(user, opponent_user, battle_context)
        percent = 15
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          percent = 35
        end
        user.attack_percent += percent
      end

      def gangetu_correction(user, opponent_user, battle_context)
        correction = opponent_user.soldier.num - user.soldier.num
        return if correction <= 0
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          correction *= 2
        end
        user.attack_correction += correction
      end

      def gankou_correction(user, opponent_user, battle_context)
        percent = 15
        correction = 5
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          percent = 35
        end
        user.defence_percent += percent
        user.defence_correction += correction
      end

      def kakuyoku_correction(user, opponent_user, battle_context)
        correction = user.soldier.num - opponent_user.soldier.num
        return if correction <= 0
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          correction *= 2
        end
        user.attack_correction += correction
      end

      def kouyaku_correction(user, opponent_user, battle_context)
        user.add_status_percents(10)
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          user.attack_percent += 30
        end
      end

      def tyouda_correction(user, opponent_user, battle_context)
        percent = 20
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          percent = 50
        end
        user.attack_percent += percent
      end

      def houen_correction(user, opponent_user, battle_context)
        percent = 30
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          percent = 50
        end
        user.defence_percent += percent
      end

      def kurumagakari_correction(user, opponent_user, battle_context)
        user.add_status_percents(10)
        if COMPATIBILITY_HASH[user.formation.to_sym].include?(opponent_user.formation.to_sym)
          user.attack_percent += 30
        end
      end

      def moroha_correction(user, opponent_user, battle_context)
        correction = user.defence
        user.defence_correction -= correction
        user.attack_correction += correction
      end

      def donjin_correction(user, opponent_user, battle_context)
        correction = user.attack / 2
        user.attack_correction -= correction
        user.defence_correction += correction
      end

      def densetu_correction(user, opponent_user, battle_context)
        user.add_status_percents(13)
      end
    end
  end
end