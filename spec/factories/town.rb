FactoryBot.define do
  factory :town do
    name { '平原' }
    country_id { 1 }
    x { 0 }
    y { 0 }
    level { 1 }
    farmer { 10000 }
    allegiance { 100 }
    max_agriculture { 1000 }
    agriculture { 800 }
    max_commerce { 1000 }
    commerce { 800 }
    technology { 800 }
    max_wall { 1000 }
    wall { 800 }
    wall_durability { 800 }
  end
end