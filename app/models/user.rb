class User < ApplicationRecord

  has_secure_password

  has_many   :comments, dependent: :destroy

  has_many   :winners, dependent: :destroy

  has_many   :likes, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true

  validates :username, presence: true, uniqueness: true

  validates :password, presence: true
  validates :name, presence: true
  validates :last_name, presence: true

  before_validation :downcase_email

  mount_uploader :avatar, AvatarUploader

  paginates_per 9

  private

  def downcase_email
    self.email = email.downcase
  end

end
