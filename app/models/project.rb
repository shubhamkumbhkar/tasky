class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many_attached :documents
  has_rich_text :description

  validates :name, presence: { message:"Can not be empty" }

end
