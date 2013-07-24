require 'spec_helper'

describe WhenIWork::Configuration do
  describe '#endpoint' do
    it 'sets the correct endpoint' do
      expect(subject.endpoint).to eq('https://api.wheniwork.com/2/')
    end

    it 'sets the default expiry time' do
      expect(subject.expires_in).to eq(60)
    end

    it 'enables cache by default' do
      expect(subject.cache_enabled).to be_true
    end
  end
end
