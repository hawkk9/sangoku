module Skills
  class AgitationSkill
    EFFECTS = [{
      level: 1,
      effect: Proc.new do |user, opponent_user|
        odds = user.charm / 11
        if rand(1..100) <= odds
          user.max_damage += 1
          Message::MessageWriter.message(
            "【鼓舞】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})"
          )
        end
      end,
      timings: []
    }]

    def initialize(level)
      @level = level
    end

    def battling_actions
      EFFECTS.map do |effect|
        effect[:battling] if effect[:level] <= @level
      end.compact
    end
  end
end
