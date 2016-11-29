class Equipment < ApplicationRecord
  has_many :rented_equipment
  has_many :contract, through: :rented_equipment

  validates :serial_number, presence: true
  validates :name, presence: true
  validates :category, presence: true
  validates :replacement_value, presence: true
  validates :acquisition_date, presence: true
  validates :usage_limit, presence: true

  def full_description
    "#{serial_number} #{name}"
  end
end
