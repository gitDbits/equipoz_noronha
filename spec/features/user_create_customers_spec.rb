require 'rails_helper'

feature 'User create costumers' do
  scenario 'sucessfully' do
    customer = build(:customer)

    visit root_path

    click_on 'Clientes'

    click_on 'Novo Cliente'

    fill_in 'Nome', with: customer.name
    select 'Jurídica', from: 'Tipo'
    fill_in 'CPF/CNPJ', with: customer.document
    fill_in 'Inscrição Estadual', with: customer.fiscal_number
    fill_in 'Razão Social', with: customer.legal_name
    fill_in 'Contato Cobrança', with: customer.contact_name
    fill_in 'Telefone', with: customer.phone_number
    fill_in 'Email', with: customer.email
    fill_in 'Endereço', with: customer.address

    click_on 'Criar Cliente'

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.customer_type)
    expect(page).to have_content(customer.document)
    expect(page).to have_content(customer.fiscal_number)
    expect(page).to have_content(customer.legal_name)
    expect(page).to have_content(customer.contact_name)
    expect(page).to have_content(customer.phone_number)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.address)
  end

  scenario 'unsucessfully' do
    visit root_path

    click_on 'Clientes'

    click_on 'Novo Cliente'

    fill_in 'Nome', with: ''
    select 'Jurídica', from: 'Tipo'
    fill_in 'CPF/CNPJ', with: ''
    fill_in 'Inscrição Estadual', with: ''
    fill_in 'Razão Social', with: ''
    fill_in 'Contato Cobrança', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'Email', with: ''
    fill_in 'Endereço', with: ''

    click_on 'Criar Cliente'

    expect(page).to have_content 'Todos os campos devem ser preenchidos.'
  end
end
