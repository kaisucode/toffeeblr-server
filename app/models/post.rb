class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  delegate :username, to: :user
end
