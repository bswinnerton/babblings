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

  describe '#for_dimensions' do
    context 'if the size passed is :thumbnail' do
      it 'returns the thumbnail image width'
      it 'returns the thumbnail image height'
    end

    context 'if the size passed is anything else' do
      context 'if the image width is less than the maximum' do
        it 'returns the image width'
        it 'returns the image height'
      end

      context 'if the image width is larger than the maximum' do
        it 'returns the maximum image width'
        it 'returns the maximum image height'
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
