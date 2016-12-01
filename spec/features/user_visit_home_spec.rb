require 'rails_helper'

feature 'user visit home' do
  scenario 'existing links home' do
    visit root_path

    expect(page).to have_link 'Home', href: root_path
    expect(page).to have_link 'Clientes', href: customers_path
    expect(page).to have_link 'Novo equipamento', href: new_equipment_path
    expect(page).to have_link 'Lista equipamentos', href: equipment_index_path
    expect(page).to have_link 'Nova categoria', href: new_category_path
    expect(page).to have_link 'Lista categorias', href: categories_path
    expect(page).to have_link 'Contratos', href: contracts_path
  end
end
