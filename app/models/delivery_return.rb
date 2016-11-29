class DeliveryReturn < ApplicationRecord
  belongs_to :contract

  validates :name, :document, presence: true
end
