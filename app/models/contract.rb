class Contract < ApplicationRecord
  has_one :delivery_receipt
  has_one :delivery_return
  belongs_to :customer
  has_many :rented_equipment
  has_many :equipment, through: :rented_equipment

  # validates_associated :equipment
  validates :customer,
            #:equipment,
            :delivery_address,
            :rental_period,
            :contact,
            :equipment,
            :rental_period,
            presence: true

  def total_contract
    total_amount - discount
  end

  def contract_number
    (created_at + id).to_i
  end
end
