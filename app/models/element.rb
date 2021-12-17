class Element < ApplicationRecord

  belongs_to :article

  mount_uploader :imgart, ImgartUploader

end
