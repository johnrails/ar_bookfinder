require 'spec_helper'

describe Arscraper::ArScraper do
  let(:scraper) { Arscraper::ArClient.instance }
  let(:results) { scraper.find('9781608180899') }
  let!(:parsed) { Arscraper::ArScraper.new(results)}

  describe 'book title based on ISBN' do
    it 'will return the book title' do
      expect(parsed.book_title).to eq('Pandas')
    end
  end

  describe 'AR book level' do
    it 'will return the book leve of the book' do
      expect(parsed .book_level).to eq('2.9')
    end
  end

  describe 'AR Points' do
    it 'will return the AR Points' do
      expect(parsed.ar_points).to eq('0.5')
    end
  end

  describe 'cover image src' do
    let(:image_src) { 'http://coverscans.renlearn.com/9780898127911.jpg' }

    it 'will return the image src' do
      expect(parsed.image_source).to eq(image_src)
    end
  end

  describe 'book description' do
    let(:desc) { "This book is a basic exploration of the appearance, behavior, and habitat of pandas, which are some of Earth's smallest bears. Also included is a story from folklore explaining why pandas have black-and-white fur."}

    it 'will return the book description' do
      expect(parsed.book_description).to eq(desc)
    end
  end

  describe '#author' do
    it 'will return the book author' do
      expect(parsed.author).to eq("Valerie Bodden")
    end
  end

  describe '#cover_image' do
    let(:image_src) { 'http://coverscans.renlearn.com/9780898127911.jpg' }
    it 'will return the cover image' do
      expect(parsed.cover_image.src).to eq(image_src)
    end
  end

  describe '#download_image' do
    it 'will return the cover image' do
      expect(parsed.download_image(Dir.new("./"))).to eq(true)
    end
  end
end
