class Soldier < ApplicationRecord
  enum rank: {
    none: 0, none_sp: 1, c: 2, c_sp: 3,
    b: 4, b_sp: 5, a: 6, a_sp: 7,
    s: 8, siege: 9, monte: 10, macao: 11,
    vegas: 12, mirror: 13
  }, _prefix: true

  enum soldier_type: {
    none: 0,
    infantry: 1,
    cavalry: 2,
    archer: 3
  }, _prefix: true

  belongs_to :user

  ATTRIBUTE_LABEL_HASH = {
    none: '無し',
    infantry: '歩',
    cavalry: '馬',
    archer: '弓',
  }

  RANK_LABEL_HASH = {
    c: 'Cランク',
    c_sp: '特Cランク',
    b: 'Bランク',
    b_sp: '特Bランク',
    a: 'Aランク',
    a_sp: '特Aランク',
    s: 'Sランク',
  }

  SOLDIER_PARAMS = [
    {
      soldier_rank: :none,
      officer_type: User::STRENGTH,
      name: '農民',
      attack: 0.8,
      defense: 0,
      soldier_type: :none,
      skill: nil,
      skill_label: nil,
      enable_equip: false,
      gold: 15,
      rank:0,
      technology: 0
    },
    {
      soldier_rank: :none_sp,
      officer_type: User::STRENGTH,
      name: '一領具足',
      attack: 0.8,
      defense: 0,
      soldier_type: :none,
      skill: nil,
      skill_label: '投石器：石を投げて攻撃する',
      enable_equip: false,
      gold: 20,
      rank:0,
      technology: 0
    },
    {
      soldier_rank: :c,
      officer_type: User::STRENGTH,
      name: '足軽兵',
      attack: 0.45,
      defense: 0.25,
      soldier_type: :infantry,
      skill: nil,
      skill_label: '',
      enable_equip: true,
      gold: 60,
      rank:5001,
      technology: 200
    },
    {
      soldier_rank: :none,
      officer_type: User::CHARM,
      name: '民衆',
      attack: 0.8,
      defense: 0,
      soldier_type: :none,
      skill: nil,
      skill_label: nil,
      enable_equip: false,
      gold: 15,
      rank:0,
      technology: 0
    },
    {
      soldier_rank: :none_sp,
      officer_type: User::CHARM,
      name: '一揆軍',
      attack: 0.8,
      defense: 0,
      soldier_type: :none,
      skill: nil,
      skill_label: '掛け声：攻撃力が上がる',
      enable_equip: true,
      gold: 20,
      rank:0,
      technology: 0
    },
    {
      soldier_rank: :c,
      officer_type: User::CHARM,
      name: '民兵',
      attack: 0.75,
      defense: 0.35,
      soldier_type: :infantry,
      skill: nil,
      skill_label: '',
      enable_equip: true,
      gold: 40,
      rank:5001,
      technology: 200
    },
    {
      soldier_rank: :c,
      officer_type: User::CHARM,
      name: '暴走族',
      attack: 0.9,
      defense: 0.2,
      soldier_type: :cavalry,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 40,
      rank:5001,
      technology: 200
    },
    {
      soldier_rank: :c,
      officer_type: User::CHARM,
      name: 'やくざ',
      attack: 1.1,
      defense: 0,
      soldier_type: :archer,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 40,
      rank:5001,
      technology: 200
    },
    {
      soldier_rank: :c_sp,
      officer_type: User::CHARM,
      name: '一向一揆軍',
      attack: 0.75,
      defense: 0.35,
      soldier_type: :infantry,
      skill: nil,
      skill_label: '竹槍：竹槍で敵を倒すぞ',
      enable_equip: true,
      gold: 50,
      rank:8000,
      technology: 200
    },
    {
      soldier_rank: :c_sp,
      officer_type: User::CHARM,
      name: '地侍',
      attack: 0.9,
      defense: 0.2,
      soldier_type: :cavalry,
      skill: nil,
      skill_label: 'すごい刀：攻撃力＋１０',
      enable_equip: true,
      gold: 50,
      rank:8000,
      technology: 200
    },
    {
      soldier_rank: :c_sp,
      officer_type: User::CHARM,
      name: '種子島の人',
      attack: 1.1,
      defense: 0,
      soldier_type: :archer,
      skill: nil,
      skill_label: '火縄銃：火縄銃で殴る',
      enable_equip: true,
      gold: 50,
      rank:8000,
      technology: 200
    },
    {
      soldier_rank: :b,
      officer_type: User::CHARM,
      name: '自警団の青年',
      attack: 0.9,
      defense: 0.4,
      soldier_type: :infantry,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 70,
      rank:11001,
      technology: 500
    },
    {
      soldier_rank: :b,
      officer_type: User::CHARM,
      name: '海賊',
      attack: 1.1,
      defense: 0.2,
      soldier_type: :cavalry,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 70,
      rank:11001,
      technology: 500
    },
    {
      soldier_rank: :b,
      officer_type: User::CHARM,
      name: '倭寇',
      attack: 1.3,
      defense: 0,
      soldier_type: :archer,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 70,
      rank:11001,
      technology: 500
    },
    {
      soldier_rank: :b_sp,
      officer_type: User::CHARM,
      name: '長島一揆軍',
      attack: 0.9,
      defense: 0.4,
      soldier_type: :infantry,
      skill: nil,
      skill_label: '鉄槍：鉄でできている槍',
      enable_equip: true,
      gold: 85,
      rank:14500,
      technology: 500
    },
    {
      soldier_rank: :b_sp,
      officer_type: User::CHARM,
      name: '豪族',
      attack: 1.1,
      defense: 0.2,
      soldier_type: :cavalry,
      skill: nil,
      skill_label: '先祖伝来の刀：攻撃力＋２０',
      enable_equip: true,
      gold: 85,
      rank:14500,
      technology: 500
    },
    {
      soldier_rank: :b_sp,
      officer_type: User::CHARM,
      name: '雑賀衆',
      attack: 1.3,
      defense: 0,
      soldier_type: :archer,
      skill: '',
      skill_label: '火縄銃：火縄銃で攻撃',
      enable_equip: true,
      gold: 85,
      rank:14500,
      technology: 500
    },
    {
      soldier_rank: :a,
      officer_type: User::CHARM,
      name: '皇兵',
      attack: 1.2,
      defense: 0.5,
      soldier_type: :infantry,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 160,
      rank:18000,
      technology: 800
    },
    {
      soldier_rank: :a,
      officer_type: User::CHARM,
      name: '武士',
      attack: 1.4,
      defense: 0.3,
      soldier_type: :cavalry,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 160,
      rank:18000,
      technology: 800
    },
    {
      soldier_rank: :a,
      officer_type: User::CHARM,
      name: '義賊',
      attack: 1.7,
      defense: 0,
      soldier_type: :archer,
      skill: nil,
      skill_label: nil,
      enable_equip: true,
      gold: 160,
      rank:18000,
      technology: 800
    },
    {
      soldier_rank: :a_sp,
      officer_type: User::CHARM,
      name: '本願寺顕如',
      attack: 1.7,
      defense: 0,
      soldier_type: :infantry,
      skill: nil,
      skill_label: '檄文：味方の攻撃力があがる',
      enable_equip: true,
      gold: 175,
      rank:22000,
      technology: 800
    },
    {
      soldier_rank: :a_sp,
      officer_type: User::CHARM,
      name: '落ち武者',
      attack: 1.7,
      defense: 0,
      soldier_type: :cavalry,
      skill: nil,
      skill_label: '渾身の一撃：渾身の一撃を加える',
      enable_equip: true,
      gold: 175,
      rank:22000,
      technology: 800
    },
    {
      soldier_rank: :a_sp,
      officer_type: User::CHARM,
      name: '孫一軍',
      attack: 1.7,
      defense: 0,
      soldier_type: :archer,
      skill: nil,
      skill_label: '雑賀筒：雑賀産の火縄銃',
      enable_equip: true,
      gold: 175,
      rank:22000,
      technology: 800
    },
    {
      soldier_rank: :s,
      officer_type: User::CHARM,
      name: '革命軍',
      attack: 1.7,
      defense: 0.6,
      soldier_type: :none,
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
      soldier_rank: :siege,
      officer_type: nil,
      name: '攻城兵',
      attack: 1.5,
      defense: 0,
      soldier_type: :none,
      skill: nil,
      skill_label: '攻城戦において、
攻＆守＝（武＋知＋統＋人望）×1.5',
      enable_equip: true,
      gold: 20,
      rank:22000,
      technology: 0
    },
    {
      soldier_rank: :mirror,
      officer_type: nil,
      name: 'ミラーマン',
      attack: 0,
      defense: 0,
      soldier_type: :none,
      skill: nil,
      skill_label: '敵の攻守値をコピー(扇動スキル３（農民加勢）の効果は適応されない)',
      enable_equip: false,
      gold: 250,
      rank:0,
      technology: 990
    },
    {
      soldier_rank: :monte,
      officer_type: nil,
      name: 'モンテカルロ隊',
      attack: 1.0,
      defense: 0.5,
      soldier_type: :none,
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
      soldier_rank: :macao,
      officer_type: nil,
      name: 'マカオ隊',
      attack: 1.5,
      defense: 0.75,
      soldier_type: :none,
      skill: nil,
      skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）×1.5
守備力＝0～（武力＋知力＋統率＋人望）×0.75
すべて運に任せろ。',
      enable_equip: true,
      gold: 175,
      rank:0,
      technology: 800,
      achievement: Achievement::MACAO
    },
    {
      soldier_rank: :vegas,
      officer_type: nil,
      name: 'ラスベガス隊',
      attack: 2.0,
      defense: 1.0,
      soldier_type: :none,
      skill: nil,
      skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）×2.0
守備力＝0～（武力＋知力＋統率＋人望）×1.0
すべて運に任せろ。',
      enable_equip: true,
      gold: 175,
      rank:0,
      technology: 800,
      achievement: Achievement::LAS_VEGAS
    },
  ]

  ADVANTAGEOUS_HASH = {
    :infantry => :archer,
    :cavalry => :infantry,
    :archer => :cavalry
  }

  after_initialize do
    @param = SOLDIER_PARAMS.find do |option|
      (option[:officer_type].nil? || option[:officer_type] == self.user.officer_type) &&
        option[:soldier_type] == self.soldier_type.to_sym && option[:soldier_rank] == self.rank.to_sym
    end
  end

  class << self
    def can_employ_soldiers(user)
      can_employ_soldier_options(user).map {|soldier_option| Soldier.new(soldier_option)}
    end

    def can_employ_soldier_options(user)
      SOLDIER_PARAMS.filter do |option|
        (option[:officer_type].nil? || option[:officer_type] == user.officer_type) &&
          option[:technology] <= user.town.technology && option[:rank] <= user.rank &&
          (option[:achievement].nil? || user.achievements.exists?(achievement_type: option[:achievement]))
      end
    end
  end

  # 例)暴走族【Cランク】
  def name_with_rank
    self.name + (self.soldier_rank_label && "【#{self.soldier_rank_label}】").to_s
  end

  def soldier_rank_label
    RANK_LABEL_HASH[@option[:soldier_rank]]
  end

  # def officer_type
  #   @option[:officer_type]
  # end

  def base_status_label
    label = User::OFFICER_TYPE_STATUS_LABEL_HASH[officer_type]
    label = "(#{label}＋#{User::OFFICER_TYPE_EQUIP_LABEL_HASH[officer_type]})" if enable_equip
    label
  end

  def is_advantageous(opponent_soldier_type)
    opponent_soldier_type == ADVANTAGEOUS_HASH[self.soldier_type]
  end
end