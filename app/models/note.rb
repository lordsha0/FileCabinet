class Note < ApplicationRecord
  validates(:titre, presence: true)
  validates(:contenu, presence: true)
end
