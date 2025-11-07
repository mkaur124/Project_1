class Teacher < ApplicationRecord
  belongs_to :school
  has_many :students, dependent: :destroy

  validates :first_name, :last_name, :subject, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
