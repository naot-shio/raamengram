require 'rails_helper'

RSpec.feature "Sign up", :type => :feature do
  let(:user) { build(:user) }

  scenario 'user navigates to the sign up page and successfully signs up' do
    user
    visit root_path
    find('a', text: 'Sign up').click
    fill_in ('user[name]'), with: user.name
    fill_in ('user[username]'), with: user.username
    fill_in ('user[email]'), with: user.email
    fill_in ('user[password]'), with: user.password
    fill_in ('user[password_confirmation]'), with: user.password_confirmation
    find('.btn').click
    expect(page).to have_selector('p', text: 'Would you like to export CSV file?')
  end
end