class Game < ApplicationRecord

  validates :question, presence: true
  validates :response, presence: true

  has_many   :winners, dependent: :destroy

end
