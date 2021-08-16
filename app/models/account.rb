class Account < ApplicationRecord
  belongs_to :agency
  has_many :transactions

  validates :number, presence: true, uniqueness: true
  validates :limit, presence: true, numericality: true
  validates :agency_id, presence: true
end
