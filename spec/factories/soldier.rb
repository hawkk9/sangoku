FactoryBot.define do
  factory :soldier do
    rank { :c }
    soldier_type { :infantry }
    num { 65 }
  end
end