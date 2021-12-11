class Game < ApplicationRecord

  validates :response, presence: true
  validates :type_of_question, presence: true

end
