require 'spec_helper'

describe PostsController do

  describe 'GET "index"' do
    let(:post) { create :picture }
    let!(:posts) { [post] }

    before :each do
      get :index, format: format
    end

    context 'html' do
      let(:format) { :html }

      it 'returns HTTP success' do
        expect(response).to be_success
      end

      it 'assigns @posts' do
        expect(assigns(:posts)).to eq posts
      end
    end

    context 'json' do
      let(:format) { :json }

      it 'returns HTTP success' do
        expect(response).to be_success
      end

      it 'assigns @posts' do
        expect(assigns(:posts)).to eq posts
      end
    end
  end

  describe 'GET "show"' do
    let(:post) { create :picture }

    before :each do
      get :show, format: format, id: post.id
    end

    context 'html' do
      let(:format) { :html }

      it 'returns HTTP success' do
        expect(response).to be_success
      end

      it 'assigns @post' do
        expect(assigns(:post)).to eq post
      end
    end

    context 'json' do
      let(:format) { :json }

      it 'returns HTTP success' do
        expect(response).to be_success
      end

      it 'assigns @post' do
        expect(assigns(:post)).to eq post
      end
    end
  end

  describe 'GET "new"' do
    it 'returns HTTP success' do
      expect(response).to be_success
    end

    it 'assigns @post'
  end

  describe 'POST "create"' do
    context 'with valid params' do
      it 'redirects to the newly created post'
    end

    context 'without valid params' do
      it 're-renders the "new" template'
    end
  end

  describe 'GET "page"' do
    let(:posts) { create_list :quote, Post.default_per_page + 1 }
    let(:page) { 2 }

    before do
      allow(Post).to receive(:default_per_page).and_return 1
      posts
      get :page, format: format, page: page
    end

    context 'html' do
      let(:format) { :html }

      it 'returns HTTP success' do
        expect(response).to be_success
      end

      it 'returns an empty layout'

      it 'assigns @posts' do
        expect(assigns(:posts)).to eq [posts.first]
      end
    end

    context 'json' do
      let(:format) { :json }

      it 'returns HTTP success' do
        expect(response).to be_success
      end

      it 'assigns @posts' do
        expect(assigns(:posts)).to eq [posts.first]
      end
    end
  end

end
