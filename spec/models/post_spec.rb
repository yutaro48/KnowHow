require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'タイトルと内容が入力されていれば、ノウハウを保存できる' do
    user = User.create!({
      email: 'test@example.com',
      password: 'password'
    })
    post = user.posts.build({
      title: Faker::Lorem.characters(number: 10),
      content: Faker::Lorem.characters(number: 100)
    })

    expect(post).to be_valid
  end
end
