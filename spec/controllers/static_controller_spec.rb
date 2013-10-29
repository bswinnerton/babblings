require 'spec_helper'

describe StaticController do
  describe 'GET #about' do
    it "responds successfully with an HTTP 200 status code" do
      get :about
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the about template" do
      get :about
      expect(response).to render_template :about
    end
  end
end
