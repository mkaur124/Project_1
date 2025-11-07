class Student < ApplicationRecord
  belongs_to :teacher

  validates :first_name, :last_name, presence: true
  validates :grade_level, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 12 }
  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
