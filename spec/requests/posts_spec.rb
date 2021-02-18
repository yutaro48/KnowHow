require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  describe "GET /posts" do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it "200ステータスが返ってくる" do
        get posts_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET /posts" do
    context 'ログインしていない場合' do
      it "ログイン画面に遷移する" do
        get posts_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /posts' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it 'ノウハウが保存される' do
        post_params = attributes_for(:post)
        post posts_path(post: post_params)
        expect(response).to have_http_status(302)
        expect(Post.last.title).to eq(post_params[:title])
        expect(Post.last.content.body.to_plain_text).to eq(post_params[:content])
      end
    end
  end

  describe 'POST /posts' do
    context 'ログインしていない場合' do
      it 'ログイン画面に遷移する' do
        post_params = attributes_for(:post)
        post posts_path(post: post_params)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
