module Soldiers
  class Soldier
    # 兵種
    NO_NONE = 0
    NO_S_NONE = 1
    SIEGE = 2
    MIRROR = 3
    MONTE_CARLO = 4
    MACAO = 5
    LAS_VEGAS = 6
    C_INFANTRY = 7
    C_CAVALRY = 8
    C_ARCHER = 9
    C_S_INFANTRY = 10
    C_S_CAVALRY = 11
    C_S_ARCHER = 12
    B_INFANTRY = 13
    B_CAVALRY = 14
    B_ARCHER = 15
    B_S_INFANTRY = 16
    B_S_CAVALRY = 17
    B_S_ARCHER = 18
    A_INFANTRY = 19
    A_CAVALRY = 20
    A_ARCHER = 21
    A_S_INFANTRY = 22
    A_S_CAVALRY = 23
    A_S_ARCHER = 24
    S_NONE = 25

    # 属性
    NONE = 0
    INFANTRY = 1
    CAVALRY = 2
    ARCHER = 3

    ATTRIBUTE_LABEL_HASH = {
      NONE => '無し',
      INFANTRY => '歩',
      CAVALRY => '馬',
      ARCHER => '弓',
    }

    # ランク
    NO_RANK = 0
    NO_S_RANK = 1
    C_RANK = 2
    C_S_RANK = 3
    B_RANK = 4
    B_S_RANK = 5
    A_RANK = 6
    A_S_RANK = 7
    S_RANK = 8

    RANK_LABEL_HASH = {
      C_RANK => 'Cランク',
      C_S_RANK => '特Cランク',
      B_RANK => 'Bランク',
      B_S_RANK => '特Bランク',
      A_RANK => 'Aランク',
      A_S_RANK => '特Aランク',
      S_RANK => 'Sランク',
    }

    SOLDIER_OPTIONS = [
      {
        soldier_type: NO_NONE,
        soldier_rank: NO_RANK,
        officer_type: User::CHARM,
        name: '民衆',
        attack: 0.8,
        defense: 0,
        attribute: NONE,
        skill: nil,
        skill_label: nil,
        enable_equip: false,
        gold: 20,
        rank:0,
        technology: 0
      },
      {
        soldier_type: NO_NONE,
        soldier_rank: NO_S_RANK,
        officer_type: User::CHARM,
        name: '一揆軍',
        attack: 0.8,
        defense: 0,
        attribute: NONE,
        skill: nil,
        skill_label: '掛け声：攻撃力が上がる',
        enable_equip: true,
        gold: 20,
        rank:0,
        technology: 0
      },
      {
        soldier_type: C_INFANTRY,
        soldier_rank: C_RANK,
        officer_type: User::CHARM,
        name: '民兵',
        attack: 0.75,
        defense: 0.35,
        attribute: INFANTRY,
        skill: nil,
        skill_label: '',
        enable_equip: true,
        gold: 40,
        rank:5001,
        technology: 200
      },
      {
        soldier_type: C_CAVALRY,
        soldier_rank: C_RANK,
        officer_type: User::CHARM,
        name: '暴走族',
        attack: 0.9,
        defense: 0.2,
        attribute: CAVALRY,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 40,
        rank:5001,
        technology: 200
      },
      {
        soldier_type: C_ARCHER,
        soldier_rank: C_RANK,
        officer_type: User::CHARM,
        name: 'やくざ',
        attack: 1.1,
        defense: 0,
        attribute: ARCHER,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 40,
        rank:5001,
        technology: 200
      },
      {
        soldier_type: C_S_INFANTRY,
        soldier_rank: C_S_RANK,
        officer_type: User::CHARM,
        name: '一向一揆軍',
        attack: 0.75,
        defense: 0.35,
        attribute: INFANTRY,
        skill: nil,
        skill_label: '竹槍：竹槍で敵を倒すぞ',
        enable_equip: true,
        gold: 50,
        rank:8000,
        technology: 200
      },
      {
        soldier_type: C_S_CAVALRY,
        soldier_rank: C_S_RANK,
        officer_type: User::CHARM,
        name: '地侍',
        attack: 0.9,
        defense: 0.2,
        attribute: CAVALRY,
        skill: nil,
        skill_label: 'すごい刀：攻撃力＋１０',
        enable_equip: true,
        gold: 50,
        rank:8000,
        technology: 200
      },
      {
        soldier_type: C_S_ARCHER,
        soldier_rank: C_S_RANK,
        officer_type: User::CHARM,
        name: '種子島の人',
        attack: 1.1,
        defense: 0,
        attribute: ARCHER,
        skill: nil,
        skill_label: '火縄銃：火縄銃で殴る',
        enable_equip: true,
        gold: 50,
        rank:8000,
        technology: 200
      },
      {
        soldier_type: B_INFANTRY,
        soldier_rank: B_RANK,
        officer_type: User::CHARM,
        name: '自警団の青年',
        attack: 0.9,
        defense: 0.4,
        attribute: INFANTRY,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 70,
        rank:11001,
        technology: 500
      },
      {
        soldier_type: B_CAVALRY,
        soldier_rank: B_RANK,
        officer_type: User::CHARM,
        name: '海賊',
        attack: 1.1,
        defense: 0.2,
        attribute: CAVALRY,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 70,
        rank:11001,
        technology: 500
      },
      {
        soldier_type: B_ARCHER,
        soldier_rank: B_RANK,
        officer_type: User::CHARM,
        name: '倭寇',
        attack: 1.3,
        defense: 0,
        attribute: ARCHER,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 70,
        rank:11001,
        technology: 500
      },
      {
        soldier_type: B_S_INFANTRY,
        soldier_rank: B_S_RANK,
        officer_type: User::CHARM,
        name: '長島一揆軍',
        attack: 0.9,
        defense: 0.4,
        attribute: INFANTRY,
        skill: nil,
        skill_label: '鉄槍：鉄でできている槍',
        enable_equip: true,
        gold: 85,
        rank:14500,
        technology: 500
      },
      {
        soldier_type: B_S_CAVALRY,
        soldier_rank: B_S_RANK,
        officer_type: User::CHARM,
        name: '豪族',
        attack: 1.1,
        defense: 0.2,
        attribute: CAVALRY,
        skill: nil,
        skill_label: '先祖伝来の刀：攻撃力＋２０',
        enable_equip: true,
        gold: 85,
        rank:14500,
        technology: 500
      },
      {
        soldier_type: B_S_ARCHER,
        soldier_rank: B_S_RANK,
        officer_type: User::CHARM,
        name: '雑賀衆',
        attack: 1.3,
        defense: 0,
        attribute: ARCHER,
        skill: '',
        skill_label: '火縄銃：火縄銃で攻撃',
        enable_equip: true,
        gold: 85,
        rank:14500,
        technology: 500
      },
      {
        soldier_type: A_INFANTRY,
        soldier_rank: A_RANK,
        officer_type: User::CHARM,
        name: '皇兵',
        attack: 1.2,
        defense: 0.5,
        attribute: INFANTRY,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 160,
        rank:18000,
        technology: 800
      },
      {
        soldier_type: A_CAVALRY,
        soldier_rank: A_RANK,
        officer_type: User::CHARM,
        name: '武士',
        attack: 1.4,
        defense: 0.3,
        attribute: CAVALRY,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 160,
        rank:18000,
        technology: 800
      },
      {
        soldier_type: A_ARCHER,
        soldier_rank: A_RANK,
        officer_type: User::CHARM,
        name: '義賊',
        attack: 1.7,
        defense: 0,
        attribute: ARCHER,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 160,
        rank:18000,
        technology: 800
      },
      {
        soldier_type: A_S_CAVALRY,
        soldier_rank: A_S_RANK,
        officer_type: User::CHARM,
        name: '本願寺顕如',
        attack: 1.7,
        defense: 0,
        attribute: INFANTRY,
        skill: nil,
        skill_label: '檄文：味方の攻撃力があがる',
        enable_equip: true,
        gold: 175,
        rank:22000,
        technology: 800
      },
      {
        soldier_type: A_S_CAVALRY,
        soldier_rank: A_S_RANK,
        officer_type: User::CHARM,
        name: '落ち武者',
        attack: 1.7,
        defense: 0,
        attribute: CAVALRY,
        skill: nil,
        skill_label: '渾身の一撃：渾身の一撃を加える',
        enable_equip: true,
        gold: 175,
        rank:22000,
        technology: 800
      },
      {
        soldier_type: A_S_ARCHER,
        soldier_rank: A_S_RANK,
        officer_type: User::CHARM,
        name: '孫一軍',
        attack: 1.7,
        defense: 0,
        attribute: ARCHER,
        skill: nil,
        skill_label: '雑賀筒：雑賀産の火縄銃',
        enable_equip: true,
        gold: 175,
        rank:22000,
        technology: 800
      },
      {
        soldier_type: S_NONE,
        soldier_rank: S_RANK,
        officer_type: User::CHARM,
        name: '革命軍',
        attack: 1.7,
        defense: 0.6,
        attribute: NONE,
        skill: nil,
        skill_label: '農民数に関係なく徴兵できる。
民忠も減らさない
戦闘終了後兵士数＋５',
        enable_equip: true,
        gold: 220,
        rank:26000,
        technology: 950
      },
      {
        soldier_type: SIEGE,
        soldier_rank: NO_RANK,
        officer_type: nil,
        name: '攻城兵',
        attack: 1.5,
        defense: 0,
        attribute: NONE,
        skill: nil,
        skill_label: '攻城戦において、
攻＆守＝（武＋知＋統＋人望）×1.5',
        enable_equip: true,
        gold: 20,
        rank:22000,
        technology: 0
      },
      {
        soldier_type: MIRROR,
        soldier_rank: NO_RANK,
        officer_type: nil,
        name: 'ミラーマン',
        attack: 0,
        defense: 0,
        attribute: NONE,
        skill: nil,
        skill_label: '敵の攻守値をコピー(扇動スキル３（農民加勢）の効果は適応されない)',
        enable_equip: false,
        gold: 250,
        rank:0,
        technology: 990
      },
      {
        soldier_type: MONTE_CARLO,
        soldier_rank: NO_RANK,
        officer_type: nil,
        name: 'モンテカルロ隊',
        attack: 1.0,
        defense: 0.5,
        attribute: NONE,
        skill: nil,
        skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）
守備力＝０～（武力＋知力＋統率＋人望）×0.5。
すべて運に任せろ。',
        enable_equip: true,
        gold: 175,
        rank:0,
        technology: 800
      },
      {
        soldier_type: MACAO,
        soldier_rank: NO_RANK,
        officer_type: nil,
        name: 'マカオ隊',
        attack: 1.5,
        defense: 0.75,
        attribute: NONE,
        skill: nil,
        skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）×1.5
守備力＝0～（武力＋知力＋統率＋人望）×0.75
すべて運に任せろ。',
        enable_equip: true,
        gold: 175,
        rank:0,
        technology: 800
      },
      {
        soldier_type: LAS_VEGAS,
        soldier_rank: NO_RANK,
        officer_type: nil,
        name: 'ラスベガス隊',
        attack: 2.0,
        defense: 1.0,
        attribute: NONE,
        skill: nil,
        skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）×2.0
守備力＝0～（武力＋知力＋統率＋人望）×1.0
すべて運に任せろ。',
        enable_equip: true,
        gold: 175,
        rank:0,
        technology: 800
      },
    ]

    class << self
      def can_employ_soldiers(user)
        can_employ_soldier_options(user).map {|soldier_option| Soldiers::Soldier.new(soldier_option)}
      end

      def can_employ_soldier_options(user)
        SOLDIER_OPTIONS.filter do |option|
          (option[:officer_type].nil? || option[:officer_type] == user.officer_type) && option[:technology] <= user.town.technology && option[:rank] <= user.rank
        end
      end
    end

    def initialize(options = {})
      @options = options
    end

    def name
      @options[:name]
    end

    def attack
      @options[:attack]
    end

    def defense
      @options[:defense]
    end

    def attribute
      @options[:attribute]
    end

    def attribute_label
      ATTRIBUTE_LABEL_HASH[@options[:attribute]]
    end

    def skill_label
      @options[:skill_label]
    end

    def gold
      @options[:gold]
    end

    def technology
      @options[:technology]
    end

    def enable_equip
      @options[:enable_equip]
    end

    def soldier_type
      @options[:soldier_type]
    end

    def soldier_rank
      @options[:soldier_rank]
    end

    def soldier_rank_label
      RANK_LABEL_HASH[@options[:soldier_rank]]
    end

    def officer_type
      @options[:officer_type]
    end

    def base_status_label
      label = User::OFFICER_TYPE_STATUS_LABEL_HASH[officer_type]
      label = "(#{label}＋#{User::OFFICER_TYPE_EQUIP_LABEL_HASH[officer_type]})" if enable_equip
      label
    end

    def before_buttle

    end

    def attack_to_s

    end

    def defence_to_s

    end
  end
end