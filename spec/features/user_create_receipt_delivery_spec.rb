require 'rails_helper'

feature 'Users issue receipt delivery' do
  scenario 'on created contract' do
    customer = create(:customer)
    equipment = create(:equipment)
    another_equipment = create(:equipment, serial_number: '987654')
    contract = create(:contract, customer: customer,
                                 equipment: [equipment, another_equipment])

    equipment_description = "#{equipment.serial_number} \
                            #{equipment.name}"

    another_equipment_description = "#{another_equipment.serial_number} \
#{another_equipment.name}"

    visit contract_path(contract)

    click_on 'Recibo Entrega'

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
    expect(page).to have_content contract.contact
    expect(page).to have_content customer.legal_name
    expect(page).to have_content customer.document
    expect(page).to have_content equipment_description
    expect(page).to have_content another_equipment_description
    expect(page).to have_content contract.rental_period
    expect(page).to have_content contract.delivery_address
    expect(page).to have_content contract.created_at
    expect(page).to have_content contract.number
  end

  scenario 'receipt already issued' do
    customer = create(:customer)
    equipment = create(:equipment)
    another_equipment = create(:equipment, serial_number: '987654')
    contract = create(:contract, customer: customer,
                                 equipment: [equipment, another_equipment])

    visit contract_path(contract)

    click_on 'Visualizar Recibo Entrega'

    expect(page).to have_css('h1', text: 'Recibo de Entrega')
  end
end
