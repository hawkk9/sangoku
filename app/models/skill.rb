class Skill < ApplicationRecord
  enum skill_type: {
    infantry: 0, cavalry: 1, archer: 2,
    move: 3, strategy: 4, tactics: 5,
    leader: 6, ninja: 7, plot: 8,
    agitation: 9, training: 10, fight: 11,
    anabasis: 12, besieging:13, bandit: 14,
    virtue: 15, elite: 16,
  }

  belongs_to :user

  TYPE_CLASS_HASH = {
    strategy: Skills::StrategySkill,
    tactics: Skills::TacticsSkill,
    leader: Skills::LeaderSkill,
    ninja: Skills::NinjaSkill,
    plot: Skills::PlotSkill,
    agitation: Skills::AgitationSkill,
    training: Skills::TrainingSkill,
    fight: Skills::FightSkill,
    anabasis: Skills::AnabasisSkill,
    bandit: Skills::BanditSkill,
    virtue: Skills::VirtueSkill,
    elite: Skills::EliteSkill
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
