class Article < ApplicationRecord

  has_many   :comments

  has_many   :elements

  validates :title,  presence: true
  validates :view,  presence: true

end
