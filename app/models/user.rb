class User < ApplicationRecord

  include PolicyManager::Concerns::UserBehavior

  has_many :blogs
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: { message: "cet email est déjà pris" }
  validates :nom, presence: true
end
