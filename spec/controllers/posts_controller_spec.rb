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
      spotify_post1, spotify_post2 = FactoryGirl.create(:post, :spotify), FactoryGirl.create(:post, :spotify)
      get :index
      expect(assigns(:posts)).to match_array([spotify_post1, spotify_post2])
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

  describe 'GET #page' do
    before :each do
      @quote_posts = 25.times.map { FactoryGirl.create(:post, :quote) }.reverse
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :page, page: '1'
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      get :page, page: '1'
      expect(response).to render_template :page
    end

    it 'loads the appropriate posts into @posts' do
      get :page, page: '1'
      expect(assigns(:posts)).to eq(@quote_posts.slice(0..Post::MAX_PER_PAGE - 1))
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
    it "creates a post and redirects to it" do
      expect { post :create, post: FactoryGirl.attributes_for(:post, :vimeo) }.to change(Post, :count).by(1)
      expect(response).to redirect_to post_path(Post.last)
    end

    it "redirects to the 'new' page if no data is given" do
      expect { post :create, post: FactoryGirl.attributes_for(:post, :vimeo).merge(content: '') }.to_not change(Post, :count)
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "responds successfully witha n HTTP 200 status code" do
      youtube_post = FactoryGirl.create(:post, :youtube)
      get :edit, id: youtube_post.id
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #update' do
    it "edits a post and redirects to it" do
      youtube_post = FactoryGirl.create(:post, :youtube)
      vimeo_post_attributes = FactoryGirl.attributes_for(:post, :vimeo)
      patch :update, id: youtube_post.id, post: vimeo_post_attributes
      youtube_post.reload
      expect(youtube_post.content).to eq(vimeo_post_attributes[:content])
    end
  end
end
