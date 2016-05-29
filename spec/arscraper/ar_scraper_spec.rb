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

end
