class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many_attached :documents

  validates :name, presence: { message:"Can not be empty" }
  validates :description, presence: { message:"Can not be empty" }

end
