FactoryBot.define do
  factory :user do
     character_id { 'soyu' }
     password_digest { 'hoge' }
     name { '醤油' }
     image_path { 1 }
     strength { 5 }
     strength_exp { 0 }
     intelligence { 5 }
     intelligence_exp { 0 }
     leadership { 65 }
     leadership_exp { 0 }
     charm { 100 }
     charm_exp { 0 }
     soldier_type { Soldiers::Soldier::C_INFANTRY }
     soldier_num { 0 }
     training { 100 }
     country_id { 1 }
     gold { 1000 }
     rice { 1000 }
     contributing { 1000 }
     rank { 10000 }
     arm { 10.0 }
     guard { 10.0 }
     book { 0.0 }
     flag { 10.0 }
     delete_turn { 48 }
     town_id { 1 }
     email { 'hoge' }
  end
end