class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  has_many   :comments, dependent: :destroy

  validates :title,  presence: true

end
