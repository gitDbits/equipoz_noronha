class Customer < ApplicationRecord
  has_many :contract

  validates :name,
            :customer_type,
            :document,
            :fiscal_number,
            :legal_name,
            :contact_name,
            :phone_number,
            :email,
            :address,
            presence: true
end
