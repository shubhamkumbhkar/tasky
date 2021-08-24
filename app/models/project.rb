class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy


  validates :name, presence: { message:"Can not be empty" }
  validates :description, presence: { message:"Can not be empty" }

end
