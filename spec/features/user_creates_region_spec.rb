require 'spec_helper'

feature 'User creates a region' do
  scenario 'with a valid name' do
    create_region_with 'name'

    expect(page).to have_content('Chicago')
  end
end

def create_region_with(name)
  region_name = 'Chicago'
  sign_in_as_admin
  visit root_path
  fill_in 'Name', with: region_name
  click_button 'Create Region'
end

def sign_in_as_admin
  email = 'admin@example.com'
  password = 'password'
  User.create(
    email: email,
    password_digest: Monban.hash_token(password),
    admin: true
  )
  visit new_session_path
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end
