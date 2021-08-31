class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  
  validates  :fname, :lname, :username, :mnum, presence: true
  validates :username, presence: true, length: {minimum: 3, maximum: 20 },
    format: { with: /\A[a-zA-Z0-9]+\z/, message: 'cannot have special characters'  },
    uniqueness: { case_sensitive: false }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
