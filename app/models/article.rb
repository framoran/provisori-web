class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  has_many   :comments, dependent: :destroy

  validates :title,  presence: true

  scope :title_contains,       ->(term) { where('title LIKE ?', "%#{term}%".downcase) }
  scope :body_contains, ->(term) { where('body LIKE ?', "%#{term}%".downcase) }
  scope :is_published, ->(term) { where('published = true') }
  scope :search, ->(term) { title_contains(term).or(body_contains(term)) }

end
