require 'spec_helper'

describe PostsController do
  describe 'GET #index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

    it "loads all of the posts into @posts" do
      post1, post2 = FactoryGirl.create(:post, :spotify), FactoryGirl.create(:post, :spotify)
      get :index
      expect(assigns(:posts)).to match_array([post1, post2])
    end
  end

  describe 'GET #show' do
    before :each do
      @post1 = FactoryGirl.create(:post, :youtube)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @post1.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :show, id: @post1.id
      expect(response).to render_template :show
    end

    it "loads the post into @post" do
      get :show, id: @post1.id
      expect(assigns(:post)).to eq(@post1)
    end
  end

  describe 'GET #new' do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end

    it "creates a new instance of Post" do
      get :new
      expect(assigns(:post)).to_not eq(nil)
    end
  end

  describe 'POST #create' do
    it "creates post and redirect to it" do
      expect { post :create, post: FactoryGirl.attributes_for(:post, :vimeo) }.to change(Post, :count).by(1)
      expect(response).to redirect_to post_path(Post.last)
    end

    it "redirects to the 'new' page if no data is given" do
      expect { post :create, post: FactoryGirl.attributes_for(:post, :vimeo).merge(content: '') }.to_not change(Post, :count)
      expect(response).to redirect_to new_post_path
    end
  end
end
