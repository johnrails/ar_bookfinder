require 'spec_helper'

RSpec.describe Arscraper::ArClient do

  subject(:scraper) { Arscraper::ArClient.instance}

  describe 'without passing an isbn' do

    it 'will return a proper warning' do
      expect {
         scraper.find('asdfasdf')
       }.to raise_exception(Arscraper::InvalidISBNError)
    end
  end
end
