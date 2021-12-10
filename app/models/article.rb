class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  has_many   :comments, dependent: :destroy

  has_many   :shares, dependent: :destroy

  has_many   :likes, dependent: :destroy

  validates :title,  presence: true

  scope :title_contains,       ->(term) { where('title LIKE ?', "%#{term}%".downcase) }
  scope :is_published, ->() { where('published = ?', 1) }
  scope :search, ->(term) { title_contains(term).and(is_published()) }

  paginates_per 6

end
