require 'spec_helper'

describe "posts" do
  before :each do
    @post1 = FactoryGirl.create(:post)
    @post2 = FactoryGirl.create(:post)
  end

  it "displays all of the posts" do
    visit root_path

    expect(page).to have_css 'img', @post1.content
    expect(page).to have_css 'img', @post2.content
  end

  it "displays individual posts" do
    visit post_path(@post1)

    expect(page).to have_css 'img', @post1.content
  end

  it "links to original content on show page" do
    visit post_path(@post1)
    find('a.post-link').click

    expect(page.current_url).to eq(@post1.original_path)
  end
end
