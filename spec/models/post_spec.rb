require 'spec_helper'

describe Post do
  it "should accept an image" do
    post1 = FactoryGirl.create(:post, :image)
    expect(post1).to have_attached_file(:image)
  end

  it "should accept everything else" do
    post1 = FactoryGirl.create(:post, :vimeo)
    expect(post1.content) == Post.last.content
  end

  it "validates presence of format" do
    expect( FactoryGirl.build(:post, :vimeo, format: '') ).to_not be_valid
  end

  it "validates presence of content" do
    expect( FactoryGirl.build(:post, :vimeo, content: '') ).to_not be_valid
  end
end
