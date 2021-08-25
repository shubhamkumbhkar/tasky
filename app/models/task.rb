class Task < ApplicationRecord
  belongs_to :project
  belongs_to :reporter, foreign_key: :reporter_id, class_name: :User
  belongs_to :assignee, foreign_key: :assignee_id, class_name: :User
  has_many_attached :documents


  validates :name, presence: true
  validates :description, presence: true
end
