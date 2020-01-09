class ConscriptionCommand < ApplicationRecord
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

  # 官種
  STRENGTH = 0
  INTELLIGENCE = 1
  LEADERSHIP = 2
  CHARM = 3

  # 属性
  NONE = 0
  INFANTRY = 1
  CAVALRY = 2
  ARCHER = 3

  # 必要階級
  C_NEED_RANK = 5001
  C_S_NEED_RANK = 8000
  B_NEED_RANK = 11001
  B_S_NEED_RANK = 14500
  A_NEED_RANK = 18000
  A_S_NEED_RANK = 22000
  S_NEED_RANK = 26000

  # 必要技術
  C_NEED_TECHNOLOGY = 200
  B_NEED_TECHNOLOGY = 500
  A_NEED_TECHNOLOGY = 800
  S_NEED_TECHNOLOGY = 950
  S_NEED_TECHNOLOGY = 990

  SOLDIER_OPTION_HASH = {
    CHARM => {
      NO_RANK => {
        name: '民衆',
        attack: 0.8, # 人望×0.8
        defense: 0, # 人望×0
        attribute: NONE,
        skill: nil,
        skill_label: '掛け声：攻撃力が上がる',
        enable_equip: false,
        gold: 20,
      }
    }
  }

  class << self
    def can_employ_soldiers(user)
      can_employ_types(user).map {|soldier_type| Soldier.new(soldier_option(user, soldier_type))}
    end

    def can_employ_types(user)
      types = [NO_RANK]
      types + [C_INFANTRY, C_CAVALRY, C_ARCHER] if self.can_employ_c(user.town.technology, user.rank)
    end

    def soldier_option(user, soldier_type)
      SOLDIER_OPTION_HASH[officer_type(user)][soldier_type]
    end

    def officer_type(user)
      CHARM
    end

    def can_employ_c(technology, rank)
      technology >= C_NEED_TECHNOLOGY && rank >= C_NEED_RANK
    end

    def can_employ_b(technology, rank)
      technology >= B_NEED_TECHNOLOGY && rank >= B_NEED_RANK
    end

    def can_employ_a(technology, rank)
      technology >= A_NEED_TECHNOLOGY && rank >= A_NEED_RANK
    end

    def can_employ_s(technology, rank)
      technology >= S_NEED_TECHNOLOGY && rank >= S_NEED_RANK
    end
  end

  def execute(user)
    user.soldier_num += self.soldier_num
    user.save
  end
end
