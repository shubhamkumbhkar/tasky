class Project < ApplicationRecord
  belongs_to :user

  validates :name, presence: { message:"Can not be empty" }
  validates :description, presence: { message:"Can not be empty" }

end
