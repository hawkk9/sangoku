FactoryBot.define do
  factory :town do
    name { '平原' }
    country_id { 1 }
    farmer { 10000 }
    allegiance { 100 }
    agriculture { 800 }
    commerce { 800 }
    technology { 800 }
    wall { 800 }
    wall_durability { 800 }

  end
end