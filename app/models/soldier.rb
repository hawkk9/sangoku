class Soldier < ApplicationRecord
  enum rank: {
    none: 0, none_sp: 1, c: 2, c_sp: 3,
    b: 4, b_sp: 5, a: 6, a_sp: 7,
    s: 8, siege: 9, monte: 10, macao: 11,
    vegas: 12, mirror: 13
  }

  enum attribute: {
    none: 0,
    infantry: 1,
    cavalry: 2,
    archer: 3
  }
end