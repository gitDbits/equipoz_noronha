require 'rails_helper'

feature 'User create costumers' do
  scenario 'sucessfully' do
    customer = Customer.new(name: 'Kinyx',
                            customer_type: 'Jurídica',
                            document: '84654102000110',
                            fiscal_number: '00000000374334',
                            legal_name: 'Kinyx Tecnologia',
                            contact_name: 'Noronha',
                            phone_number: '69 34413650',
                            email: 'dbs.noronha@gmail.com',
                            address: 'Av. Cuiaba')

    visit new_customer_path

    fill_in 'Nome', with: customer.name
    fill_in 'Tipo', with: customer.customer_type
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
    visit new_customer_path

    fill_in 'Nome', with: ''
    fill_in 'Tipo', with: ''
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
