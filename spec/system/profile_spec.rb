require 'rails_helper'

RSpec.describe 'Profile', type: :system do
  let!(:user) { create(:user, :with_profile) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    it '自分のプロフィールを作成できる' do
      visit posts_path
      expect(page).to have_css('.description', text: user.profile.birthday)
    end
  end
end