require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user) }

  context 'タイトルと内容が入力されている場合' do
    let!(:post) do
      user.posts.build({
        title: Faker::Lorem.characters(number: 10),
        content: Faker::Lorem.characters(number: 100)
      })
    end

    it 'ノウハウを保存できる' do
      expect(post).to be_valid
    end
  end

  context 'タイトルの文字が1文字の場合' do
    let!(:post) do
      user.posts.create({
        title: Faker::Lorem.characters(number: 1),
        content: Faker::Lorem.characters(number: 100)
      })
    end

    it 'ノウハウを保存できない' do
      expect(post.errors.messages[:title][0]).to eq('は2文字以上で入力してください')
    end
  end

  context 'タイトルの文字が30文字以上の場合' do
    let!(:post) do
      user.posts.create({
        title: Faker::Lorem.characters(number: 40),
        content: Faker::Lorem.characters(number: 100)
      })
    end

    it 'ノウハウを保存できない' do
      expect(post.errors.messages[:title][0]).to eq('は30文字以内で入力してください')
    end
  end
end
