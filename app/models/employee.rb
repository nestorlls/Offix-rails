class Employee < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :birth_date,
            comparison: { less_than: 18.years.ago, message: "must be older than 18 years" }

  # Associations
  belongs_to :department, counter_cache: true

  # Active storage
  has_one_attached :avatar
end
