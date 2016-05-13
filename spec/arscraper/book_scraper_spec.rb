require 'spec_helper'

RSpec.describe Arscraper::BookScraper do

  subject(:scraper) { Arscraper::BookScraper.instance}

  describe 'without passing an isbn' do

    it 'will return a proper warning' do
      expect {
         scraper.find('asdfasdf')
       }.to raise_exception(Arscraper::InvliadIsbnError)
    end
  end
end
