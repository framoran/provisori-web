class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  has_many   :comments, dependent: :destroy

  validates :title,  presence: true
  validates :view,  presence: true

end
