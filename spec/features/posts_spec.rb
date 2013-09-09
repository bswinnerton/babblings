require 'spec_helper'

describe "posts" do
  before :each do
    @post1 = FactoryGirl.create(:post)
    @post2 = FactoryGirl.create(:post)
  end

  it "displays all of the posts" do
    visit root_path
    expect(page).to have_content @post1.content
    expect(page).to have_content @post2.content
  end
end
