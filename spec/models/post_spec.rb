require 'spec_helper'

describe Post do
  it "should accept an image" do
    image_post = FactoryGirl.create(:post, :image)
    expect(image_post).to have_attached_file(:image)
  end

  it "should accept everything else" do
    vimeo_post = FactoryGirl.create(:post, :vimeo)
    expect(vimeo_post.content) == Post.last.content
  end

  it "validates presence of format" do
    expect(FactoryGirl.build(:post, :vimeo, format: '')).to_not be_valid
  end

  it "validates presence of content" do
    expect(FactoryGirl.build(:post, :vimeo, content: '')).to_not be_valid
  end

  it "displays posts in the order that they were created" do
    pending
  end
end
