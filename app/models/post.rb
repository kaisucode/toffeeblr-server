class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  has_one :active_reblog, class_name: "Reblog", 
    foreign_key: "child_id", 
    dependent: :destroy
  has_many :passive_reblogs, class_name: "Reblog", 
    foreign_key: "parent_id", 
    dependent: :destroy
  has_one :parent, through: :active_reblog
  has_many :children, through: :passive_reblogs, source: :child

  def reblog(parent_post)
    self.update(parent: parent_post)
  end

  delegate :username, to: :user
end
