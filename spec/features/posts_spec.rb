require 'spec_helper'

describe "Posts ->" do
  context "create:" do
    it 'shows the new post page' do
      visit new_post_path
      expect(page).to have_field('post_content')
    end

    it 'creates a new post and redirects to the show page', js: true do
      new_youtube_post = FactoryGirl.attributes_for(:post, :youtube)
      visit new_post_path
      click_button 'format_button'
      click_link new_youtube_post[:format]
      fill_in 'post_content', with: new_youtube_post[:content]
      click_button 'Submit'
      expect(page).to have_xpath "//iframe[contains(@src, '#{new_youtube_post[:content]}')]"
    end

    it 'does not allow the user to submit a blank post' do
      visit new_post_path
      fill_in 'post_content', with: ''
      click_button 'Submit'
      expect(page).to have_content 'Content can\'t be blank'
    end
  end

  context "read:" do
    it 'displays all of the posts' do
      image_post = FactoryGirl.create(:post, :image)
      youtube_post = FactoryGirl.create(:post, :youtube)
      vimeo_post = FactoryGirl.create(:post, :vimeo)
      #quote_post = FactoryGirl.create(:post, :quote)
      spotify_post = FactoryGirl.create(:post, :spotify)
      #soundcloud_post = FactoryGirl.create(:post, :soundcloud)
      #definition_post = FactoryGirl.create(:post, :definition)
      visit root_path
      expect(page).to have_xpath "//img[contains(@src, '#{image_post.image.url(:thumbnail)}')]"
      expect(page).to have_xpath "//iframe[contains(@src, '#{youtube_post.content}')]"
      expect(page).to have_xpath "//iframe[contains(@src, '#{vimeo_post.content}')]"
      #expect(page).to have_content quote_post.content
      expect(page).to have_xpath "//iframe[contains(@src, '#{spotify_post.content}')]"
      #expect(page).to have_content soundcloud_post.content
      #expect(page).to have_content definition_post.content
    end

    it 'displays an individual image page' do
      image_post = FactoryGirl.create(:post, :image)
      visit post_path(image_post)
      expect(page).to have_xpath "//img[contains(@src, '#{image_post.image.url(:large)}')]"
    end

    it 'displays an individual youtube page' do
      youtube_post = FactoryGirl.create(:post, :youtube)
      visit post_path(youtube_post)
      expect(page).to have_xpath "//iframe[contains(@src, '#{youtube_post.content}')]"
    end

    it 'displays an individual vimeo page' do
      vimeo_post = FactoryGirl.create(:post, :vimeo)
      visit post_path(vimeo_post)
      expect(page).to have_xpath "//iframe[contains(@src, '#{vimeo_post.content}')]"
    end

    it 'displays an individual quote page' do
      quote_post = FactoryGirl.create(:post, :quote)
      visit post_path(quote_post)
      pending
    end

    it 'displays an individual spotify page' do
      spotify_post = FactoryGirl.create(:post, :spotify)
      visit post_path(spotify_post)
      expect(page).to have_xpath "//iframe[contains(@src, '#{spotify_post.content}')]"
    end

    it 'displays an individual soundcloud page' do
      soundcloud_post = FactoryGirl.create(:post, :soundcloud)
      visit post_path(soundcloud_post)
      pending
    end

    it 'displays an individual definition page' do
      definition_post = FactoryGirl.create(:post, :definition)
      visit post_path(definition_post)
      pending
    end

    it 'links to original content on individual image page' do
      image_post = FactoryGirl.create(:post, :image)
      visit post_path(image_post)
      expect(page).to have_selector "a[href='#{image_post.content}']"
    end
  end


  context "update:" do
    it 'shows the edit post page' do
      quote_post = FactoryGirl.create(:post, :quote)
      visit edit_post_path(quote_post)
      expect(page).to have_field('post_content')
    end

    it 'edits an existing post and redirects to the show page', js: true do
      new_vimeo_post = FactoryGirl.attributes_for(:post, :vimeo)
      existing_youtube_post = FactoryGirl.create(:post, :youtube)
      visit edit_post_path(existing_youtube_post)
      click_button 'format_button'
      click_link new_vimeo_post[:format]
      fill_in 'post_content', with: new_vimeo_post[:content]
      click_button 'Submit'
      expect(page).to have_xpath "//iframe[contains(@src, '#{new_vimeo_post[:content]}')]"
    end

    it 'shows the appropriate format and content when editing' do
      definition_post = FactoryGirl.create(:post, :definition)
      visit edit_post_path(definition_post)
      expect(page).to have_xpath "//button[contains(text(), '#{definition_post.format.humanize}')]"
      expect(page).to have_xpath "//input[contains(@value, '#{definition_post.content}')]"
    end

    it 'does not allow the user to submit a blank post' do
      existing_soundcloud_post = FactoryGirl.create(:post, :soundcloud)
      visit edit_post_path(existing_soundcloud_post)
      fill_in 'post_content', with: ''
      click_button 'Submit'
      expect(page).to have_content 'Content can\'t be blank'
    end
  end

  context "destroy:" do
  end
end
