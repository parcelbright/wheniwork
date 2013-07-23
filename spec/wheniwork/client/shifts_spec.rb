require 'spec_helper'

describe WhenIWork::Client::Shifts do
  subject(:client) do
    WhenIWork.configuration.cache_enabled = false
    WhenIWork::Client.new
  end

  before do
    client.stub(:token).and_return('abc123')
  end

  describe '#shift' do
    context 'for an existing shift' do
      before { stub_get('shifts/976?W-Token=abc123').to_return(
        body: fixture('shift_976.json')) }

      it 'returns the expected shift' do
        expect(client.shift(976)['shift']['id']).to eq(976)
      end
    end

    context 'for an unknown shift' do
      before { stub_get('shifts/-1?W-Token=abc123').to_return(
        body: fixture('shift_unknown.json')) }

      it 'does not return a shift' do
        expect(client.shift(-1)['shift']).to be_nil
      end

      it 'returns an error message' do
        expect(client.shift(-1)['error']).to eq('No shift found')
      end

      it 'returns an error code' do
        expect(client.shift(-1)['code']).to eq(4005)
      end
    end
  end

  describe '#shifts' do
    context 'with available shifts' do
      before { stub_get('shifts?W-Token=abc123').to_return(
        body: fixture('shifts.json')) }

      it 'returns a hash of results' do
        expect(client.shifts.keys).to eq(["start", "end", "shifts",
                                          "users", "locations"])
      end

      it 'contains one user' do
        expect(client.shifts['users'].count).to eq(1)
      end

      it 'contains four shifts' do
        expect(client.shifts['shifts'].count).to eq(4)
      end
    end

    context 'without any shifts' do
      before { stub_get('shifts?W-Token=abc123').to_return(
        body: fixture('empty_shifts.json')) }

      it 'returns empty shifts' do
        expect(client.shifts['shifts']).to be_empty
      end

      it 'returns no users' do
        expect(client.shifts['users']).to be_nil
      end
    end
  end
end
