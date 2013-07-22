require 'spec_helper'

describe WhenIWork::Configuration do
  describe '#endpoint' do
    it 'sets the correct endpoint' do
      expect(subject.endpoint).to eq('https://api.wheniwork.com/2/')
    end
  end
end
