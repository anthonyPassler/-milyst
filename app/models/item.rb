class Item < ApplicationRecord
  acts_as_list
  belongs_to :list
  belongs_to :user

  validates :name, presence: true
end
