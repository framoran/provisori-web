class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  has_many   :comments, dependent: :destroy

  has_many   :likes

  validates :title,  presence: true

  mount_uploader :image, ImageUploader

  scope :title_contains,       ->(term) { where('title LIKE ?', "%#{term}%".downcase) }
  scope :is_published, ->() { where('published = ?', 1) }
  scope :search, ->(term) { title_contains(term).and(is_published()) }

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

  paginates_per 6

end
