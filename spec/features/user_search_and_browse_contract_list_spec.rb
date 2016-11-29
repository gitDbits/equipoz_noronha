require 'rails_helper'

feature 'user list all contract on inital page' do
  scenario 'list all contracts' do
    customer = create(:customer)
    equipment = create(:equipment)
    contract = create(:contract, customer: customer, equipment: [equipment])

    visit root_path

    expect(page).to have_content(contract.customer.name)
    expect(page).to have_content(contract.delivery_address)
    expect(page).to have_content(contract.total_amount)
  end

  scenario 'no contract list' do
    visit root_path
    expect(page).to have_content('Não foi possível encontrar nenhum contrato')
  end

  scenario 'list two contracts' do
    customer1 = create(:customer)
    equipment1 = create(:equipment)
    contract1 = create(:contract, customer: customer1, equipment: [equipment1])

    customer2 = create(:customer, name: 'Cliente 2')
    equipment2 = create(:equipment, name: 'descriçao 2')
    contract2 = create(:contract, customer: customer2, equipment: [equipment2])

    visit root_path

    expect(page).to have_content(contract1.customer.name)
    expect(page).to have_content(contract1.delivery_address)
    expect(page).to have_content(contract1.total_amount)

    expect(page).to have_content(contract2.customer.name)
    expect(page).to have_content(contract2.delivery_address)
    expect(page).to have_content(contract2.total_amount)
  end
end
