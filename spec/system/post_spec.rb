require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, status: 1, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    it 'ノウハウ一覧が表示される' do
      visit posts_path
      posts.each do |post|
        expect(page).to have_css('.description', text: post.title)
      end
    end
  end

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    it 'ノウハウの詳細を表示できる' do
      visit posts_path
      post = posts.first
      click_on post.title
      expect(page).to have_css('.title', text: post.title)
      expect(page).to have_css('.description', text: post.content.to_plain_text)
    end
  end
end