class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :likes, dependent: :nullify
  has_many :comment, dependent: :nullify
  mount_uploader :image, ImageUploader
end
