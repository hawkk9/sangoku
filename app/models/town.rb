class Town < ApplicationRecord
  has_many :town_defences
  belongs_to :country
end
