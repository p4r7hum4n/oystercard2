require 'station'

describe Station do
  # it { is_expected.to respond_to :station_name }

  # it { is_expected.to respond_to :zone }

  # subject {described_class.new(name: "Oxford St", zone: 3)}

  it 'returns the station name' do
    station = Station.new("Oxford St", 3)
    expect(station.name).to eq ("Oxford St")
  end

  it 'returns the zone' do
    station = Station.new("Oxford St", 3) 
    expect(station.zone).to eq(3)
  end
end