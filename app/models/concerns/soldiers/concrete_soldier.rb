module Soldiers
  class ConcreteSoldier

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
      def soldier_params
        [
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
            need_rank: 0,
            technology: 0
          },
          {
            soldier_rank: :none_sp,
            officer_type: User::STRENGTH,
            name: '一領具足',
            attack: 0.8,
            defence: 0,
            soldier_type: :none,
            skill: [additional_attack_effect(5, 20, '投石器', 'の投石機！')],
            skill_label: '投石器：石を投げて攻撃する',
            enable_equip: false,
            gold: 20,
            need_rank: 0,
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
            enable_equip: false,
            gold: 60,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: '軽騎兵',
            attack: 0.5,
            defence: 0.1,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 60,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: '軽弓兵',
            attack: 0.6,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 60,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '盾兵',
            attack: 0.35,
            defence: 0.25,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 70,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '軽騎兵',
            attack: 0.5,
            defence: 0.1,
            soldier_type: :cavalry,
            skill: [additional_attack_effect(5, 20, '長槍', 'の長槍！')],
            skill_label: '長槍：敵を串刺しにする',
            enable_equip: false,
            gold: 70,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '火矢兵',
            attack: 0.6,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 70,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: '護衛兵',
            attack: 0.6,
            defence: 0.4,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 90,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: '騎兵',
            attack: 0.8,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 90,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: '弓衆',
            attack: 1,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 90,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '近衛兵',
            attack: 0.6,
            defence: 0.4,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 105,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '馬廻り',
            attack: 0.8,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: [additional_attack_effect(7, 15, '馬上槍', 'の馬上槍！')],
            skill_label: '馬上槍：敵を蹴散らすぞ',
            enable_equip: false,
            gold: 105,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '鉄砲衆',
            attack: 1,
            defence: 0,
            soldier_type: :archer,
            skill: [additional_attack_effect(10, 20, '火縄銃', 'の火縄銃！')],
            skill_label: '火縄銃：火縄銃で攻撃',
            enable_equip: false,
            gold: 105,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: '重装歩兵',
            attack: 1,
            defence: 0.5,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 150,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: '重騎兵',
            attack: 1.2,
            defence: 0.3,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 150,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: '長弓兵',
            attack: 1.5,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 150,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '山県隊',
            attack: 1,
            defence: 0.5,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 165,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '武田騎馬',
            attack: 1.2,
            defence: 0.3,
            soldier_type: :cavalry,
            skill: [up_max_damage_effect(2, 20, '欧州の馬')],
            skill_label: '奥州の馬：なんかすごい馬',
            enable_equip: false,
            gold: 165,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '砲兵',
            attack: 1.5,
            defence: 0,
            soldier_type: :archer,
            skill: [additional_attack_effect(12, 25, '大筒', 'の大筒！')],
            skill_label: '大筒：大筒で攻撃',
            enable_equip: false,
            gold: 165,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :s,
            officer_type: User::STRENGTH,
            name: '東方遠征軍',
            attack: 1.5,
            defence: 0.7,
            soldier_type: :none,
            skill_label: '',
            enable_equip: false,
            gold: 220,
            need_rank: 26000,
            technology: 950
          },
          {
            soldier_rank: :none,
            officer_type: User::STRENGTH,
            name: '僧兵',
            attack: 0.8,
            defence: 0,
            soldier_type: :none,
            skill: nil,
            skill_label: nil,
            enable_equip: false,
            gold: 15,
            need_rank: 0,
            technology: 0
          },
          {
            soldier_rank: :none_sp,
            officer_type: User::STRENGTH,
            name: '斥候',
            attack: 0.8,
            defence: 0,
            soldier_type: :none,
            skill: [additional_attack_effect(5, 20, '手裏剣', 'の手裏剣！')],
            skill_label: '手裏剣：手裏剣で攻撃',
            enable_equip: false,
            gold: 20,
            need_rank: 0,
            technology: 0
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: 'グラディエイター',
            attack: 0.75,
            defence: 0.35,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 40,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: 'セイバー',
            attack: 0.9,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 40,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: 'ボウマン',
            attack: 1.1,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 40,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '長槍兵',
            attack: 0.75,
            defence: 0.35,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 50,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '騎手',
            attack: 0.9,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: [additional_attack_effect(7, 20, 'エクスカリバー', 'のエクスカリバー！')],
            skill_label: 'エクスカリバー：エクスカリバーで殴る',
            enable_equip: true,
            gold: 50,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '弓名人',
            attack: 1.1,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 50,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: 'ジェネラル',
            attack: 0.9,
            defence: 0.4,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 70,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: 'ライダー',
            attack: 1.1,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 70,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: 'レンジャー',
            attack: 1.3,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 70,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '尾張兵衆',
            attack: 0.9,
            defence: 0.4,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 85,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '美濃衆',
            attack: 1.1,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: [up_max_damage_effect(1, 20, '美濃八千騎')],
            skill_label: '美濃八千騎：攻撃力が上がる',
            enable_equip: true,
            gold: 85,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '宮城県民',
            attack: 1.3,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 85,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: 'ドミニオン',
            attack: 1.2,
            defence: 0.5,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 160,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: 'ドラグーン',
            attack: 1.4,
            defence: 0.3,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 160,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: 'アークエンジェル',
            attack: 1.7,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 160,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '鬼柴田',
            attack: 1.2,
            defence: 0.5,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: true,
            gold: 175,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '蒙武軍',
            attack: 1.4,
            defence: 0.3,
            soldier_type: :cavalry,
            skill: [up_max_damage_effect(2, 20, '蹂躙せよ！！')],
            skill_label: '蹂躙せよ！！：攻撃力があがる',
            enable_equip: true,
            gold: 175,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '義元軍',
            attack: 1.7,
            defence: 0,
            soldier_type: :archer,
            skill: [additional_attack_effect(10, 15, '今川仮名目録', 'の今川仮名目録！')],
            skill_label: '今川仮名目録：仮名目録で往復ビンタ',
            enable_equip: true,
            gold: 175,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :s,
            officer_type: User::STRENGTH,
            name: '透波',
            attack: 1.6,
            defence: 0.6,
            soldier_type: :none,
            skill_label: '',
            enable_equip: true,
            gold: 220,
            need_rank: 26000,
            technology: 950
          },
          {
            soldier_rank: :none,
            officer_type: User::STRENGTH,
            name: '山賊',
            attack: 0.6,
            defence: 0,
            soldier_type: :none,
            skill: nil,
            skill_label: nil,
            enable_equip: false,
            gold: 20,
            need_rank: 0,
            technology: 0
          },
          {
            soldier_rank: :none_sp,
            officer_type: User::STRENGTH,
            name: '野伏',
            attack: 0.6,
            defence: 0,
            soldier_type: :none,
            skill: [additional_attack_effect(5, 20, '鈍器', 'の鈍器！')],
            skill_label: '鈍器：敵をぶん殴る',
            enable_equip: false,
            gold: 25,
            need_rank: 0,
            technology: 0
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: 'ガード',
            attack: 0.45,
            defence: 0.25,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 60,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: 'ナイト',
            attack: 0.6,
            defence: 0.1,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 60,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c,
            officer_type: User::STRENGTH,
            name: 'シューター',
            attack: 0.7,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 60,
            need_rank: 5001,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '警備員',
            attack: 0.45,
            defence: 0.25,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 70,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '馬廻り',
            attack: 0.6,
            defence: 0.1,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 70,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :c_sp,
            officer_type: User::STRENGTH,
            name: '短弓兵',
            attack: 0.7,
            defence: 0,
            soldier_type: :archer,
            skill: [additional_attack_effect(2, 7, '乱れ打ち', 'の乱れ打ち！')],
            skill_label: '乱れ打ち：弓を撃ちまくる',
            enable_equip: false,
            gold: 70,
            need_rank: 8000,
            technology: 200
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: 'ガードマン',
            attack: 0.7,
            defence: 0.4,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 80,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: 'シルバーナイト',
            attack: 0.9,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 80,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b,
            officer_type: User::STRENGTH,
            name: 'アーチャー',
            attack: 1.1,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 80,
            need_rank: 11001,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '警察官',
            attack: 0.7,
            defence: 0.4,
            soldier_type: :infantry,
            skill: [additional_attack_effect(8, 15, 'ピストル', 'のピストル！')],
            skill_label: 'ピストル：風穴を開ける',
            enable_equip: false,
            gold: 90,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '親衛隊',
            attack: 0.9,
            defence: 0.2,
            soldier_type: :cavalry,
            skill: [up_max_damage_effect(1, 20, '檄')],
            skill_label: '檄：攻撃力が上がる',
            enable_equip: false,
            gold: 90,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :b_sp,
            officer_type: User::STRENGTH,
            name: '長弓兵',
            attack: 1.1,
            defence: 0,
            soldier_type: :archer,
            skill: [additional_attack_effect(10, 20, '長弓', 'の長弓！')],
            skill_label: '長弓：長い弓で串刺し',
            enable_equip: false,
            gold: 90,
            need_rank: 14500,
            technology: 500
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: 'ロイヤルガード',
            attack: 1.1,
            defence: 0.5,
            soldier_type: :infantry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 105,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: 'パラディン',
            attack: 1.3,
            defence: 0.3,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 105,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a,
            officer_type: User::STRENGTH,
            name: 'スナイパー',
            attack: 1.6,
            defence: 0,
            soldier_type: :archer,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 105,
            need_rank: 18000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '自衛隊',
            attack: 1.1,
            defence: 0.5,
            soldier_type: :infantry,
            skill: [additional_attack_effect(8, 12, 'マシンガン', 'のマシンガン！')],
            skill_label: 'マシンガン：めちゃ撃ちまくる',
            enable_equip: false,
            gold: 120,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '治部少輔軍',
            attack: 1.3,
            defence: 0.3,
            soldier_type: :cavalry,
            skill: nil,
            skill_label: '',
            enable_equip: false,
            gold: 120,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :a_sp,
            officer_type: User::STRENGTH,
            name: '狙撃兵',
            attack: 1.6,
            defence: 0,
            soldier_type: :archer,
            skill: [additional_attack_effect(15, 25, '対物ライフル', 'の対物ライフル！')],
            skill_label: '対物ライフル：息の根を止める',
            enable_equip: false,
            gold: 120,
            need_rank: 22000,
            technology: 800
          },
          {
            soldier_rank: :s,
            officer_type: User::STRENGTH,
            name: '十字軍',
            attack: 1.7,
            defence: 0.7,
            soldier_type: :none,
            skill_label: '',
            enable_equip: false,
            gold: 170,
            need_rank: 26000,
            technology: 950
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
            need_rank: 0,
            technology: 0
          },
          {
            soldier_rank: :none_sp,
            officer_type: User::CHARM,
            name: '一揆軍',
            attack: 0.8,
            defence: 0,
            soldier_type: :none,
            skill: [up_max_damage_effect(1, 20, '掛け声')],
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
            skill: [additional_attack_effect(7, 20, '竹槍', 'の竹槍！')],
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
            skill: [additional_attack_effect(5, 15, '火縄銃', 'の火縄銃！')],
            skill_label: '火縄銃：火縄銃で攻撃',
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
            skill: [additional_attack_effect(10, 20, '鉄槍', 'の鉄槍！')],
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
            skill: [additional_attack_effect(5, 15, '火縄銃', 'の火縄銃！')],
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
            skill: [up_max_damage_effect(2, 20, '檄文')],
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
            skill: [additional_attack_effect(15, 25, '投石器', 'の投石機！')],
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
            skill: [additional_attack_effect(10, 20, '投石器', 'の投石機！')],
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
      end

      def additional_attack_effect(max_damage, odds_denominator, effect_name, effect_message)
        Proc.new do |user, opponent_user, battle_context|
          messages = []
          odds = user.main_status / odds_denominator
          if Util::Calculator::draw_lots(odds)
            damage = rand(1..max_damage)
            opponent_user.soldier.num -= damage
            messages << Message::MessageWriter.message(
              "【#{effect_name}】#{user.name}#{effect_message}" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
            )
          end
          messages
        end
      end

      def up_max_damage_effect(up_damage, odds_denominator, effect_name)
        Proc.new do |user, opponent_user, battle_context|
          messages = []
          odds = user.main_status / odds_denominator
          if Util::Calculator::draw_lots(odds)
            user.add_max_damage(up_damage)
            messages << Message::MessageWriter.message(
              "【#{effect_name}】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})"
            )
          end
          messages
        end
      end

      def can_employ_soldiers(user)
        self.can_employ_soldier_params(user).map {|param| self.new(param)}
      end

      def can_employ_soldier_params(user)
        self.soldier_params.filter do |param|
          (param[:officer_type].nil? || param[:officer_type] == user.officer_type) &&
            param[:technology] <= user.town.technology && param[:need_rank] <= user.rank &&
            (param[:achievement].nil? || user.achievements.exists?(achievement_type: param[:achievement]))
        end
      end

      def to_concrete_soldier(officer_type, soldier_type, soldier_rank)
        param = self.soldier_params.find do |param|
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

    def available_effects
      @common_soldier.skill || []
    end
  end
end
