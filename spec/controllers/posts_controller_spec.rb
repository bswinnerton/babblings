require 'spec_helper'

describe PostsController do

  describe 'GET "index"' do
    before :each do
      get :index
    end

    it 'returns HTTP success' do
      expect(response).to be_success
    end

    it 'assigns @posts'
  end

  describe 'GET "show"' do
    let(:post) { create :picture }

    before :each do
      get :show, id: post.id
    end

    it 'returns HTTP success' do
      expect(response).to be_success
    end

    it 'assigns @post'
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
    let(:post) { create :picture }

    it 'returns HTTP success' do
      expect(response).to be_success
    end

    it 'returns an empty layout'
    it 'assigns @posts'
  end

end
