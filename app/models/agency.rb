class Agency < ApplicationRecord
  has_many :accounts

  validates :number, presence: true, uniqueness: true
  validates :address, presence: true
end
