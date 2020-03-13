class Skill < ApplicationRecord
  enum skill_type: {
    hohei: 0, bajutu: 1, kyujutu: 2,
    idou: 3, senryaku: 4, senjutu: 5,
    sidousya: 6, ninjutu: 7, bouryaku: 8,
    sendou: 9, noukyou: 10, kakutou: 11,
    ensei: 12, roujyou:13, sanzoku: 14,
    jintoku: 15, seiei: 16,
  }

  belongs_to :user

  TYPE_CLASS_HASH = {
    hohei: Skills::HoheiSkill,
    bajutu: Skills::BajutuSkill,
    kyujutu: Skills::KyujutuSkill,
    idou: Skills::IdouSkill,
    senryaku: Skills::SenryakuSkill,
    senjutu: Skills::SenjutuSkill,
    sidousya: Skills::SidousyaSkill,
    ninjutu: Skills::NinjutuSkill,
    bouryaku: Skills::BouryakuSkill,
    sendou: Skills::SendouSkill,
    noukyou: Skills::NoukyouSkill,
    kakutou: Skills::KakutouSkill,
    ensei: Skills::EnseiSkill,
    roujyou: Skills::RoujouSkill,
    sanzoku: Skills::SanzokuSkill,
    jintoku: Skills::JintokuSkill,
    seiei: Skills::SeieiSkill
  }

  class << self
    def options_by_skill(skill, timings)

    end
  end

  def typed_skill
    cls = TYPE_CLASS_HASH[self.skill_type.to_sym]
    cls.new(self.level)
  end
end
