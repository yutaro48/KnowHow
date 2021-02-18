require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'タイトルと内容が入力されている場合' do
    let!(:user) do
      User.create!({
        email: 'test@example.com',
        password: 'password'
      })
    end

    let!(:post) do
      user.posts.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 100)
      })
    end

    it 'ノウハウを保存できる' do
      expect(@post).to be_valid
    end
  end
end
