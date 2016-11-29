require 'rails_helper'

feature 'user issues delivery returns' do
  scenario 'created delivery return' do
    customer = create(:customer)
    equipment = create(:equipment)
    another_equipment = create(:equipment, serial_number: '976413')
    contract = create(:contract,
                      customer: customer,
                      equipment: [equipment, another_equipment])
    delivery_return = build(:delivery_return, contract: contract)
    full_description = " #{equipment.serial_number} #{equipment.name}"

    visit contract_path(contract)

    click_on 'Recibo Devolução'

    fill_in 'Nome', with: delivery_return.name
    fill_in 'CPF', with: delivery_return.document

    click_on 'Emitir'

    expect(page).to have_content delivery_return.name
    expect(page).to have_content equipment.full_description
    expect(page).to have_content another_equipment.full_description
    expect(page).to have_content contract.number
    expect(page).to have_content customer.legal_name
    expect(page).to have_content customer.document
    expect(page).to have_content delivery_return.created_at
    expect(page).to have_content contract.delivery_return.document
  end
  scenario 'receipt returns already issued' do
    customer = create(:customer)
    equipment = create(:equipment)
    another_equipment = create(:equipment, serial_number: '976413')
    contract = create(:contract,
                      customer: customer,
                      equipment: [equipment, another_equipment])

    visit contract_path(contract)

    click_on 'Recibo Entrega'

    visit contract_path(contract)

    click_on 'Recibo Devolução'

    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''

    click_on 'Emitir'

    expect(page).to have_content 'Não foi possivel emitir Recibo Devolução'
  end
end
