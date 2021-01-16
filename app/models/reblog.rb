class Reblog < ApplicationRecord
  belongs_to :parent, class_name: "Post"
  belongs_to :child, class_name: "Post"
  validates :parent_id, presence: true
  validates :child_id, presence: true
end
