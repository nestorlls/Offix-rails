class Department < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true

  # Associations
  has_many :employees, dependent: :destroy
end
