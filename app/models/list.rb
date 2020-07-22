class List < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
end
