module Battle
  class Percent
    def initialize(percent)
      @percent = percent
    end

    # value の @percent% を計算
    def calculate(value)
      result = value * @percent / 100.0
      result.ceil
    end
  end
end

