class Country < ApplicationRecord
  GLAY = 0
  WINE = 1

  COLORS = {
    GLAY => {main: '#666666', sub: '#f1f1f1'},
    WINE => {main: '#800000', sub: '#ffcfcf'},
  }

  has_many :towns
end
