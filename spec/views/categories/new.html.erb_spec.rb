require 'rails_helper'

RSpec.feature 'New Category Page:', type: :feature do
  before :each do
    @user = User.new(name: 'Ken', email: 'ken@ken.com', password: 'password', password_confirmation: 'password')
    @user.save
    visit user_session_path
    fill_in 'user_email', with: 'ken@ken.com'
    fill_in 'user_password', with: 'password'
    click_button 'LOG IN'
    visit categories_path
    visit new_category_path
  end

  context 'Page Contents: ' do
    it 'can view Category creation page' do
      expect(page).to have_current_path(new_category_path)
    end

    it 'contains button to "CREATE CATEGORY"' do
      expect(page).to have_button 'CREATE CATEGORY'
    end
  end

  context 'Page Function:' do
    it 'click link to "BACK TO CATEGORY"' do
      visit categories_path
      visit new_category_path
      click_link 'BACK TO CATEGORY'
      expect(page).to have_current_path(new_category_path)
    end

    it 'click link to create category "CREATE CATEGORY"' do
      click_button 'CREATE CATEGORY'
      expect(page).to have_current_path(categories_path)
    end
  end
end
