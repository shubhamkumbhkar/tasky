class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  
  validates  :fname, :lname, :username, :mnum, presence: true
  validates :username, presence: true, length: {minimum: 3, maximum: 20 },
    format: { with: /\A[a-zA-Z0-9]+\z/, message: 'cannot have special characters'  },
    uniqueness: { case_sensitive: false }
  validates :mnum, length: { is: 10 }, numericality: { only_integer: true }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
