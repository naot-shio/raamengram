require 'rails_helper'

describe 'Post', type: :system do
  describe 'Show the list of posts' do
    let(:user_a) { FactoryBot.create(:user, name: 'UserA', username: 'UsernameA', email: 'usera@example.com' )}
    let(:user_b) { FactoryBot.create(:user, name: 'UserB', username: 'UsernameB', email: 'userb@example.com' )}
    
    before do
      FactoryBot.create(:post, name: 'Shop1', user:user_a)
      visit new_user_session_path
      fill_in 'Email', with: login_user.email
      fill_in 'Password', with: login_user.password
      click_button 'Log in'
      visit user_path(login_user)
    end

    context 'When user_a is logged in' do
      let(:login_user) { user_a }
      it 'should show the posts created by user1' do
        expect(page).to have_content 'Shop1'
      end
    end

    context 'When user_b is logged in' do
      let(:login_user) { user_b }
      it 'should not show the posts created by user1' do
        expect(page).to have_no_content 'Shop1'
      end
    end
  end
end