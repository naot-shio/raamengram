require 'rails_helper'

RSpec.feature "Logout", :type => :feature do
  let(:user) { create(:user) }

  scenario 'user successfully signs out' do
    sign_in user
    visit root_path
    find('#logout').click
    expect(page).to have_selector('a', text: 'Sign in')
  end
end