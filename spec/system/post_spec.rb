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
        expect(page).to have_content(post.title)
      end
    end
  end
end