class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true,
                    uniqueness: true

  before_validation :downcase_email

  mount_uploader :avatar, AvatarUploader

  private

  def downcase_email
    self.email = email.downcase
  end

end
