require 'rails_helper'

RSpec.describe Contract, type: :model do
  before do
    @contract = Contract.new(delivery_address: 'Rua Funchal',
                             rental_period: '10D',
                             total_amount: 100,
                             discount: 10,
                             contact: 'Moacir Otranto')
  end

  context 'calculate total contratc ' do
    it '#total_contract' do
      total_contract = @contract.total_amount - @contract.discount
      expect(@contract.total_contract).to be total_contract
    end
  end
end
