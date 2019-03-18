require 'rails_helper'

RSpec.feature "Sign in", :type => :feature do
  let(:user) { create(:user) }

  scenario 'user navigates to the sign in page and successfully signs in' do
    user
    visit root_path
    find('a', text: 'Sign in').click
    fill_in ('user[email]'), with: user.email
    fill_in ('user[password]'), with: user.password
    find('.btn').click
    expect(page).to have_selector('p', text: 'Would you like to export CSV file?')
  end
end