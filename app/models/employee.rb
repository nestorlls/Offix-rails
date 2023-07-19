class Employee < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true,
  validates :birth_date, comparison: { less_than: 18.years.ago, 
                                        message: "must be at least 18 years old" }

  # Associations
  belongs_to :department
end
