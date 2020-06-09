FactoryBot.define do
  factory :country do
    name { '豆板醤国' }
    main_color { '#800000' }
    sub_color { '#ffcfcf' }

    factory :opponent_country do
      name { '甘党国' }
    end
  end
end