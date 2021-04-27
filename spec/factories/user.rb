FactoryBot.define do
  factory :user do
    character_id { 'soyu' }
    password_digest { 'hoge' }
    name { '醤油' }
    image_path { 1 }
    strength { 100 }
    strength_exp { 0 }
    intelligence { 5 }
    intelligence_exp { 0 }
    leadership { 65 }
    leadership_exp { 0 }
    charm { 5 }
    charm_exp { 0 }
    formation { :gyorin }
    training { 100 }
    association :town
    country { town.country }
    gold { 10000 }
    rice { 10000 }
    contributing { 1000 }
    rank { 10000 }
    arm { 10.0 }
    guard { 10.0 }
    book { 0.0 }
    flag { 10.0 }
    delete_turn { 48 }
    email { 'hoge' }
    update_time { (30.minutes+30.seconds).to_i }
    association :soldier

    factory :opponent_user do
      character_id { 'sato' }
      name { '砂糖' }
      association :town, factory: :opponent_town
    end
  end
end
