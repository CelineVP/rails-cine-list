class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end


# Une liste doit avoir un nom unique.
# Une liste a plusieurs signets
# Une liste a plusieurs films avec des signets
# Quand tu supprimes une liste, tu dois supprimer tous les signets associés
# (mais pas les films, car ils peuvent être indiqués en référence dans d’autres listes)
# Tu ne peux pas supprimer de film s’il est indiqué en référence dans au moins un signet
