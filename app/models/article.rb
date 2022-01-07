class Article < ApplicationRecord

  has_many   :elements, dependent: :destroy

  has_many   :comments, dependent: :destroy

  has_many   :likes, dependent: :destroy

  validates :title,  presence: true

  mount_uploader :image, ImageUploader

  scope :title_contains,       ->(term) { where( 'lower(title) LIKE ?', "%#{term}%".downcase ) }
  scope :is_published, ->() { where('published = ?', true) }
  scope :search, ->(term) { is_published().and(title_contains(term)) }

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

  paginates_per 6

end
