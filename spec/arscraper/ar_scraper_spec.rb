require 'spec_helper'

describe Arscraper::ArScraper do
  let(:scraper) { Arscraper::ArClient.instance }
  let(:results) { scraper.find('9781608180899') }
  let!(:parsed) { Arscraper::ArScraper.new(results)}

  it 'will return the book title' do
    expect(parsed.book_title).to eq('Pandas')
  end
end
