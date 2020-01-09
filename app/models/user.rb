class User < ApplicationRecord
  has_many :commands
  belongs_to :town
end
