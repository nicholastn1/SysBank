class Agency < ApplicationRecord
  has_many :accounts

  validates :number, presence: true, uniqueness: true
  validates :address, presence: true

  def agency_format
    "AG: #{self.number.to_s}"
  end

end
