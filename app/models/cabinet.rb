class Cabinet < ApplicationRecord
  validates(:nom, presence: true)
end
