class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  validates :title,  presence: true
  validates :view,  presence: true

end
