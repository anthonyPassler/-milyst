class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists, dependent: :destroy
  has_one_attached :photo

  validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
end
