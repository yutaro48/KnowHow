require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }

  context '内容が入力されている場合' do
    let!(:post) { build(:post, user: user) }
    let!(:comment) { build(:comment, user: user, post: post) }

    it 'コメントを保存できる' do
      expect(comment).to be_valid
    end
  end
end
