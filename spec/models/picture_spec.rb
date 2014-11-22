require 'spec_helper'

describe Picture do
  #TODO: Mock out paperclip so we're not creating images in tests

  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
                allowing('image/png', 'image/gif', 'image/jpg').
                rejecting('text/plain', 'text/xml') }

  describe '.geometry' do
    let(:image)   { double }
    let(:width)   { 100 }
    let(:height)  { 400 }
    let(:image_with_dimensions) { double(width: width, height: height) }

    it 'returns an array of width, height and ratio' do
      expect(Paperclip::Geometry).to receive(:from_file).with(image).and_return image_with_dimensions
      Picture.geometry(image)
    end
  end

  describe '#to_json' do
    let(:picture) { create :picture }
    let(:parsed_json) { JSON.parse(picture.to_json) }

    it 'includes the thumbnail_image' do
      expect(parsed_json.keys).to include 'thumbnail_image'
    end

    it 'includes the full_image' do
      expect(parsed_json.keys).to include 'full_image'
    end
  end

  describe '#width_for' do
    context 'if the size passed is :thumbnail' do
      it 'returns the thumbnail image width'
    end

    context 'if the size passed is anything else' do
      context 'if the image width is less than the maximum' do
        it 'returns the image width'
      end

      context 'if the image width is larger than the maximum' do
        it 'returns the maximum image width'
      end
    end
  end

  describe '#save_image' do
    it 'fetches the image from a remote source'
  end

  describe '#set_dimensions' do
    it 'sets the height attribute'
    it 'sets the width attribute'
    it 'sets the ratio attribute'
  end

end
