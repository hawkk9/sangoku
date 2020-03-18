FactoryBot.define do
  factory :soldier do
    rank { :c }
    soldier_type { :infantry }
    soldier_num { 65 }
  end
end