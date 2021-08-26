class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many_attached :documents
  has_rich_text :description
  has_many :comments, as: :commentable

  validates :name, presence: { message:"Can not be empty" }

end
