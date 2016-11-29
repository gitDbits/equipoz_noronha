require 'rails_helper'
feature 'User create equipments' do
  scenario 'successfully' do
    visit new_equipment_path

    fill_in('Número de série', with: '123456789')
    fill_in('Nome', with: 'Furadeira Bosch preta')
    fill_in('Categoria', with: 'Furadeira 500w')
    fill_in('Custo de reposição', with: '500')
    fill_in('Data de aquisição', with: '01/01/2010')
    fill_in('Validade', with: '8')

    click_on 'Cadastrar'

    expect(page).to have_content('123456789')
    expect(page).to have_content('Furadeira Bosch preta')
    expect(page).to have_content('Furadeira 500w')
    expect(page).to have_content('500')
    expect(page).to have_content('01/01/2010')
    expect(page).to have_content('8')

    find_link('Voltar').visible?
  end

  scenario 'unsuccessfully' do
    visit new_equipment_path

    fill_in('Número de série', with: '')
    fill_in('Nome', with: '')
    fill_in('Categoria', with: '')
    fill_in('Custo de reposição', with: '')
    fill_in('Data de aquisição', with: '')
    fill_in('Validade', with: '')

    click_on 'Cadastrar'

    expect(page).to have_content 'Não foi possível cadastrar. \
Todos os campos devem ser preenchidos'
  end
end
