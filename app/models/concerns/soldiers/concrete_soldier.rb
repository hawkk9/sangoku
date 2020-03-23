module Soldiers
  class ConcreteSoldier
    SOLDIER_PARAMS = [
      {
        soldier_rank: :none,
        officer_type: User::STRENGTH,
        name: '農民',
        attack: 0.8,
        defence: 0,
        soldier_type: :none,
        skill: nil,
        skill_label: nil,
        enable_equip: false,
        gold: 15,
        need_rank:0,
        technology: 0
      },
      {
        soldier_rank: :none_sp,
        officer_type: User::STRENGTH,
        name: '一領具足',
        attack: 0.8,
        defence: 0,
        soldier_type: :none,
        skill: nil,
        skill_label: '投石器：石を投げて攻撃する',
        enable_equip: false,
        gold: 20,
        need_rank:0,
        technology: 0
      },
      {
        soldier_rank: :c,
        officer_type: User::STRENGTH,
        name: '足軽兵',
        attack: 0.45,
        defence: 0.25,
        soldier_type: :infantry,
        skill: nil,
        skill_label: '',
        enable_equip: true,
        gold: 60,
        need_rank:5001,
        technology: 200
      },
      {
        soldier_rank: :none,
        officer_type: User::CHARM,
        name: '民衆',
        attack: 0.8,
        defence: 0,
        soldier_type: :none,
        skill: nil,
        skill_label: nil,
        enable_equip: false,
        gold: 15,
        need_rank:0,
        technology: 0
      },
      {
        soldier_rank: :none_sp,
        officer_type: User::CHARM,
        name: '一揆軍',
        attack: 0.8,
        defence: 0,
        soldier_type: :none,
        skill: nil,
        skill_label: '掛け声：攻撃力が上がる',
        enable_equip: true,
        gold: 20,
        need_rank:0,
        technology: 0
      },
      {
        soldier_rank: :c,
        officer_type: User::CHARM,
        name: '民兵',
        attack: 0.75,
        defence: 0.35,
        soldier_type: :infantry,
        skill: nil,
        skill_label: '',
        enable_equip: true,
        gold: 40,
        need_rank:5001,
        technology: 200
      },
      {
        soldier_rank: :c,
        officer_type: User::CHARM,
        name: '暴走族',
        attack: 0.9,
        defence: 0.2,
        soldier_type: :cavalry,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 40,
        need_rank:5001,
        technology: 200
      },
      {
        soldier_rank: :c,
        officer_type: User::CHARM,
        name: 'やくざ',
        attack: 1.1,
        defence: 0,
        soldier_type: :archer,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 40,
        need_rank:5001,
        technology: 200
      },
      {
        soldier_rank: :c_sp,
        officer_type: User::CHARM,
        name: '一向一揆軍',
        attack: 0.75,
        defence: 0.35,
        soldier_type: :infantry,
        skill: nil,
        skill_label: '竹槍：竹槍で敵を倒すぞ',
        enable_equip: true,
        gold: 50,
        need_rank:8000,
        technology: 200
      },
      {
        soldier_rank: :c_sp,
        officer_type: User::CHARM,
        name: '地侍',
        attack: 0.9,
        defence: 0.2,
        soldier_type: :cavalry,
        skill: nil,
        skill_label: 'すごい刀：攻撃力＋１０',
        enable_equip: true,
        gold: 50,
        need_rank:8000,
        technology: 200
      },
      {
        soldier_rank: :c_sp,
        officer_type: User::CHARM,
        name: '種子島の人',
        attack: 1.1,
        defence: 0,
        soldier_type: :archer,
        skill: nil,
        skill_label: '火縄銃：火縄銃で殴る',
        enable_equip: true,
        gold: 50,
        need_rank:8000,
        technology: 200
      },
      {
        soldier_rank: :b,
        officer_type: User::CHARM,
        name: '自警団の青年',
        attack: 0.9,
        defence: 0.4,
        soldier_type: :infantry,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 70,
        need_rank:11001,
        technology: 500
      },
      {
        soldier_rank: :b,
        officer_type: User::CHARM,
        name: '海賊',
        attack: 1.1,
        defence: 0.2,
        soldier_type: :cavalry,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 70,
        need_rank:11001,
        technology: 500
      },
      {
        soldier_rank: :b,
        officer_type: User::CHARM,
        name: '倭寇',
        attack: 1.3,
        defence: 0,
        soldier_type: :archer,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 70,
        need_rank:11001,
        technology: 500
      },
      {
        soldier_rank: :b_sp,
        officer_type: User::CHARM,
        name: '長島一揆軍',
        attack: 0.9,
        defence: 0.4,
        soldier_type: :infantry,
        skill: nil,
        skill_label: '鉄槍：鉄でできている槍',
        enable_equip: true,
        gold: 85,
        need_rank:14500,
        technology: 500
      },
      {
        soldier_rank: :b_sp,
        officer_type: User::CHARM,
        name: '豪族',
        attack: 1.1,
        defence: 0.2,
        soldier_type: :cavalry,
        skill: nil,
        skill_label: '先祖伝来の刀：攻撃力＋２０',
        enable_equip: true,
        gold: 85,
        need_rank:14500,
        technology: 500
      },
      {
        soldier_rank: :b_sp,
        officer_type: User::CHARM,
        name: '雑賀衆',
        attack: 1.3,
        defence: 0,
        soldier_type: :archer,
        skill: '',
        skill_label: '火縄銃：火縄銃で攻撃',
        enable_equip: true,
        gold: 85,
        need_rank:14500,
        technology: 500
      },
      {
        soldier_rank: :a,
        officer_type: User::CHARM,
        name: '皇兵',
        attack: 1.2,
        defence: 0.5,
        soldier_type: :infantry,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 160,
        need_rank:18000,
        technology: 800
      },
      {
        soldier_rank: :a,
        officer_type: User::CHARM,
        name: '武士',
        attack: 1.4,
        defence: 0.3,
        soldier_type: :cavalry,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 160,
        need_rank:18000,
        technology: 800
      },
      {
        soldier_rank: :a,
        officer_type: User::CHARM,
        name: '義賊',
        attack: 1.7,
        defence: 0,
        soldier_type: :archer,
        skill: nil,
        skill_label: nil,
        enable_equip: true,
        gold: 160,
        need_rank:18000,
        technology: 800
      },
      {
        soldier_rank: :a_sp,
        officer_type: User::CHARM,
        name: '本願寺顕如',
        attack: 1.7,
        defence: 0,
        soldier_type: :infantry,
        skill: nil,
        skill_label: '檄文：味方の攻撃力があがる',
        enable_equip: true,
        gold: 175,
        need_rank:22000,
        technology: 800
      },
      {
        soldier_rank: :a_sp,
        officer_type: User::CHARM,
        name: '落ち武者',
        attack: 1.7,
        defence: 0,
        soldier_type: :cavalry,
        skill: nil,
        skill_label: '渾身の一撃：渾身の一撃を加える',
        enable_equip: true,
        gold: 175,
        need_rank:22000,
        technology: 800
      },
      {
        soldier_rank: :a_sp,
        officer_type: User::CHARM,
        name: '孫一軍',
        attack: 1.7,
        defence: 0,
        soldier_type: :archer,
        skill: nil,
        skill_label: '雑賀筒：雑賀産の火縄銃',
        enable_equip: true,
        gold: 175,
        need_rank:22000,
        technology: 800
      },
      {
        soldier_rank: :s,
        officer_type: User::CHARM,
        name: '革命軍',
        attack: 1.7,
        defence: 0.6,
        soldier_type: :none,
        skill: nil,
        skill_label: '農民数に関係なく徴兵できる。
民忠も減らさない
戦闘終了後兵士数＋５',
        enable_equip: true,
        gold: 220,
        need_rank:26000,
        technology: 950
      },
      {
        soldier_rank: :siege,
        officer_type: nil,
        name: '攻城兵',
        attack: 1.5,
        defence: 0,
        soldier_type: :none,
        skill: nil,
        skill_label: '攻城戦において、
攻＆守＝（武＋知＋統＋人望）×1.5',
        enable_equip: true,
        gold: 20,
        need_rank:22000,
        technology: 0
      },
      {
        soldier_rank: :mirror,
        officer_type: nil,
        name: 'ミラーマン',
        attack: 0,
        defence: 0,
        soldier_type: :none,
        skill: nil,
        skill_label: '敵の攻守値をコピー(扇動スキル３（農民加勢）の効果は適応されない)',
        enable_equip: false,
        gold: 250,
        need_rank:0,
        technology: 990
      },
      {
        soldier_rank: :monte,
        officer_type: nil,
        name: 'モンテカルロ隊',
        attack: 1.0,
        defence: 0.5,
        soldier_type: :none,
        skill: nil,
        skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）
守備力＝０～（武力＋知力＋統率＋人望）×0.5。
すべて運に任せろ。',
        enable_equip: true,
        gold: 175,
        need_rank:0,
        technology: 800
      },
      {
        soldier_rank: :macao,
        officer_type: nil,
        name: 'マカオ隊',
        attack: 1.5,
        defence: 0.75,
        soldier_type: :none,
        skill: nil,
        skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）×1.5
守備力＝0～（武力＋知力＋統率＋人望）×0.75
すべて運に任せろ。',
        enable_equip: true,
        gold: 175,
        need_rank:0,
        technology: 800,
        achievement: Achievement::MACAO
      },
      {
        soldier_rank: :vegas,
        officer_type: nil,
        name: 'ラスベガス隊',
        attack: 2.0,
        defence: 1.0,
        soldier_type: :none,
        skill: nil,
        skill_label: '攻撃力＝０～（武力＋知力＋統率＋人望）×2.0
守備力＝0～（武力＋知力＋統率＋人望）×1.0
すべて運に任せろ。',
        enable_equip: true,
        gold: 175,
        need_rank:0,
        technology: 800,
        achievement: Achievement::LAS_VEGAS
      },
    ]

    SOLDIER_TYPE_LABEL_HASH = {
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

    CommonSoldier = Struct.new(
      :soldier_rank, :officer_type, :name,
      :attack, :defence, :soldier_type,
      :skill, :skill_label, :enable_equip,
      :gold, :need_rank, :technology, keyword_init: true
    )

    delegate :name, :attack, :defence, :technology, :gold, :soldier_rank, :soldier_type, :officer_type, :enable_equip, :skill_label, to: :@common_soldier

    class << self
      def can_employ_soldiers(user)
        self.can_employ_soldier_params(user).map {|param| self.new(param)}
      end

      def can_employ_soldier_params(user)
        SOLDIER_PARAMS.filter do |param|
          (param[:officer_type].nil? || param[:officer_type] == user.officer_type) &&
            param[:technology] <= user.town.technology && param[:need_rank] <= user.rank &&
            (param[:achievement].nil? || user.achievements.exists?(achievement_type: param[:achievement]))
        end
      end

      def to_concrete_soldier(officer_type, soldier_type, soldier_rank)
        param = SOLDIER_PARAMS.find do |param|
          (param[:officer_type].nil? || param[:officer_type] == officer_type) &&
            param[:soldier_type] == soldier_type.to_sym && param[:soldier_rank] == soldier_rank.to_sym
        end
        self.new(param)
      end
    end

    def initialize(param)
      @common_soldier = CommonSoldier.new(param)
    end

    # 例)暴走族【Cランク】
    def name_with_rank
      self.name + (self.soldier_rank_label && "【#{self.soldier_rank_label}】").to_s
    end

    def soldier_type_label
      SOLDIER_TYPE_LABEL_HASH[self.soldier_type]
    end

    def soldier_rank_label
      RANK_LABEL_HASH[self.soldier_rank]
    end

    def base_status_label
      label = User::OFFICER_TYPE_STATUS_LABEL_HASH[self.officer_type]
      label = "(#{label}＋#{User::OFFICER_TYPE_EQUIP_LABEL_HASH[self.officer_type]})" if self.enable_equip
      label
    end
  end
end
