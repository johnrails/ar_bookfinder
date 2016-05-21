require 'spec_helper'

RSpec.describe Arscraper::ArClient do

  subject(:scraper) { Arscraper::ArClient.instance}

  describe 'without passing an isbn' do

    it 'will return a proper warning' do
      expect {
         scraper.find('asdfasdf')
       }.to raise_exception(Arscraper::InvalidISBNError)
    end

    it 'will not return an error with a valid ISBN' do
      expect{
        scraper.find(9781419711763)
      }.to_not raise_exception(Arscraper::InvalidISBNError)
    end
  end
end
