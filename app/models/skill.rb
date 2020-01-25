class Skill < ApplicationRecord
  belongs_to :user

  enum skill_type: {
    infantry: 0, cavalry: 1, archer: 2,
    move: 3, strategy: 4, tactics: 5,
    leader: 6, ninja: 7, plot: 8,
    agitation: 9, training: 10, fight: 11,
    anabasis: 12, besieging:13, bandit: 14,
    virtue: 15, elite: 16,
  }


  SKILL_OPTIONS = [
    {
      type: :ninja,
      level: 1,
    }
  ]

  class << self
    def filter_by_level(skills)

    end

    def options_by_skill(skill)
      SKILL_OPTIONS.filter do |skill_option|
        (skill_option[:type] == skill.skill_type.to_sym) &&
          (skill_option[:level] <= skill.level)
      end
    end
  end
end
