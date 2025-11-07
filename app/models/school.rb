class School < ApplicationRecord
  has_many :teachers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :city, presence: true
  validates :founded_year, numericality: { only_integer: true, greater_than: 1800 }, allow_nil: true
end
