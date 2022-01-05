class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  has_many   :comments, dependent: :destroy

  has_many   :likes

  validates :title,  presence: true

  mount_uploader :image, ImageUploader

  scope :title_contains,       ->(term) { where( 'title Like ?', "%#{term}%".downcase ) }
  scope :title_contains_capital,       ->(term) { where( 'title LIKE ?', "%#{term}%" ) }
  scope :is_published, ->() { where('published = ?', true) }
  scope :search, ->(term) { is_published().and(title_contains(term).or(title_contains_capital(term))) }

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

  paginates_per 6

end
