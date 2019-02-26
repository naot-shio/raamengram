require 'rails_helper'

describe 'Post', type: :system do
  describe 'Show the list of posts' do
    let(:user_a) { FactoryBot.create(:user, name: 'UserA', username: 'UsernameA', email: 'usera@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'UserB', username: 'UsernameB', email: 'userb@example.com') }
    let(:post_a) { FactoryBot.create(:post, name: 'Shop1', user: user_a)}
    
    before do
      FactoryBot.create(:post, name: 'Shop1', user:user_a)
      visit new_user_session_path
      fill_in 'Email', with: login_user.email
      fill_in 'Password', with: login_user.password
      click_button 'Log in'
    end

    describe 'Show the list of posts that are created by individual users' do
      context 'When user_a is logged in' do
        let(:login_user) { user_a }
        
        before do
          visit user_path(login_user)
        end

        it 'should show the posts created by user1' do
          expect(page).to have_content 'Shop1'
        end
      end

      context 'When user_b is logged in' do
        let(:login_user) { user_b }
        
        before do
          visit user_path(login_user)
        end

        it 'should not show the posts created by user1' do
          expect(page).to have_no_content 'Shop1'
        end
      end
    end

    describe 'Show a post detail' do
      let(:login_user) { user_a }

      before do
        visit  post_path(post_a)
      end

      it 'should show the detail for post a' do
        expect(page).to have_content 'Shop1'
      end
    end

    describe 'Show a list of posts that user_a liked' do
      let(:login_user) { user_a }

      before do
        visit  post_path(post_a)
        find(".fa-heart").click
        visit likes_path
      end

      it 'should show the post a' do
        expect(page).to have_content 'Shop1'
      end
    end
  end
end