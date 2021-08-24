class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :name, presence: { message:"Can not be empty" }
  validates :description, presence: { message:"Can not be empty" }

end
