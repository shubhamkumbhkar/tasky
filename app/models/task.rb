class Task < ApplicationRecord
  belongs_to :project
  belongs_to :reporter, foreign_key: :reporter_id, class_name: :User
  belongs_to :assignee, foreign_key: :assignee_id, class_name: :User
  has_many_attached :documents
  has_rich_text :description


  validates :name, presence: true
end
