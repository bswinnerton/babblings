require 'spec_helper'

describe Api::V1::PostsController do

  describe 'GET "index"' do
    let(:post) { create :picture }
    let!(:posts) { [post] }

    before :each do
      get :index, format: :json
    end

    it 'returns HTTP success' do
      expect(response).to be_success
    end

    it 'assigns @posts' do
      expect(assigns(:posts)).to eq posts
    end
  end

  describe 'GET "show"' do
    let(:post) { create :picture }

    before :each do
      get :show, id: post.id, format: :json
    end

    it 'returns HTTP success' do
      expect(response).to be_success
    end

    it 'assigns @post' do
      expect(assigns(:post)).to eq post
    end
  end

  describe 'GET "page"' do
    let(:posts) { create_list :quote, Post.default_per_page + 1 }
    let(:page) { 2 }

    before do
      allow(Post).to receive(:default_per_page).and_return 1
      posts
      get :page, page: page, format: :json
    end

    it 'returns HTTP success' do
      expect(response).to be_success
    end

    it 'assigns @posts' do
      expect(assigns(:posts)).to eq [posts.first]
    end
  end

end
