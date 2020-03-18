FactoryBot.define do
  factory :soldier do
    rank { :c }
    attribute { :infantry }
    soldier_num { 65 }
  end
end