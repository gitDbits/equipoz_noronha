require 'rails_helper'

feature 'user create category' do
  scenario 'successfully' do
    visit new_category_path

    fill_in('Nome', with: 'Furadeira 500w')

    click_on 'Cadastrar'

    expect(page).to have_content('Furadeira 500w')

    find_link('Voltar').visible?
  end


  scenario 'unsuccessfully' do
    visit new_category_path

    fill_in('Nome', with: '')

    click_on 'Cadastrar'

    expect(page).to have_content('Não foi possível cadastrar!')

    find_link('Voltar').visible?
  end
end
