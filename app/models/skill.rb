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

  ATTACK = 0
  DEFENCE = 1

  SKILL_CLASSES = [
    {
      type: :strategy,
      class: Skills::StrategySkill
    },
    {
      type: :tactics,
      class: Skills::TacticsSkill
    },

    {
      type: :leader,
      class: Skills::LeaderSkill
    },
    {
      type: :ninja,
      class: Skills::NinjaSkill
    },
    {
      type: :plot,
      class: Skills::PlotSkill
    },
    {
      type: :agitation,
      class: Skills::AgitationSkill
    },
    {
      type: :training,
      class: Skills::TrainingSkill
    },
    {
      type: :fight,
      class: Skills::FightSkill
    },
    {
      type: :anabasis,
      class: Skills::AnabasisSkill
    },
    {
      type: :bandit,
      class: Skills::BanditSkill
    },
    {
      type: :virtue,
      class: Skills::VirtueSkill
    },
    {
      type: :elite,
      class: Skills::EliteSkill
    },
  ]

  class << self
    def options_by_skill(skill, timings)
      SKILL_CLASSES.filter do |skill_option|
        (skill_option[:type] == skill.skill_type.to_sym) &&
          (skill_option[:level] <= skill.level) &&
          ((skill_option[:timings] & timings).length == skill_option[:timings].length)
      end
    end
  end
end
