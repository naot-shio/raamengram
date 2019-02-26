require 'rails_helper'

describe 'Post', type: :system do
  describe 'Show the list of posts' do
    before do
      # Create user_a
      user_a = FactoryBot.create(:user, name: 'UserA', username: 'UsernameA', email: 'usera@example.com')
      # User1 should be the tester
      FactoryBot.create(:post, name: 'Shop1', user: user_a)
    end
    context 'When user_a is logged in' do
      before do
        # the tester should be logged in as user_a
        visit new_user_session_path
        fill_in 'Email', with: 'usera@example.com'
        fill_in 'Password', with: 'password'
        click_button 'Log in'
      end

      it 'should show the posts created by user1' do
        #show the list of posts
        expect(page).to have_content 'Shop1'
      end
    end
  end
end