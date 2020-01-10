module Soldiers
  class Soldier
    # 兵種
    NO_RANK = 0
    NO_S_RANK = 1
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
    S_RANK = 25

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

    SOLDIER_OPTIONS = [
      {
        soldier_type: NO_RANK,
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
        soldier_type: NO_RANK,
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
    ]

    class << self
      def can_employ_soldiers(user)
        can_employ_soldier_options(user).map {|soldier_option| Soldiers::Soldier.new(soldier_option)}
      end

      def can_employ_soldier_options(user)
        SOLDIER_OPTIONS.filter do |option|
          option[:officer_type] == user.officer_type && option[:technology] <= user.town.technology && option[:rank] <= user.rank
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